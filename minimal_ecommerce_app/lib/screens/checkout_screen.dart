import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/model/shop_model.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _contactController = TextEditingController();
  String _paymentMethod = 'Cash on Delivery';
  String? _nameError;
  String? _addressError;
  String? _contactError;

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  void _placeOrder(BuildContext context) {
    setState(() {
      _nameError = _nameController.text.isEmpty
          ? 'Please enter your name'
          : null;
      _addressError = _addressController.text.isEmpty
          ? 'Please enter your address'
          : null;
      _contactError = _contactController.text.isEmpty
          ? 'Please enter your contact number'
          : null;
    });

    if (_nameError == null && _addressError == null && _contactError == null) {
      final shopModel = Provider.of<ShopModel>(context, listen: false);
      final cart = shopModel.userCart;
      final total = cart.fold(0.0, (sum, item) => sum + item.price);

      // Save order to history
      shopModel.addOrder(
        List.from(cart), // Create a copy of cart items
        total,
        _paymentMethod,
      );

      // Clear the cart
      shopModel.clearCart();

      // Show success dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Success',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Your order has been placed successfully!',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/shop_screen',
                  (route) => false,
                ); // Navigate back to shop screen
              },
              child: Text(
                'OK',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<ShopModel>().userCart;
    final total = cart.fold(0.0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.primary,
            size: 28,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary
            Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Total: Rs.${total.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 20),

            // Payment Method
            Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: _paymentMethod,
              isExpanded: true,
              items: ['Cash on Delivery', 'Credit Card', 'PayPal']
                  .map(
                    (method) =>
                        DropdownMenuItem(value: method, child: Text(method)),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _paymentMethod = value!;
                });
              },
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
              dropdownColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 20),

            // Billing Information
            Text(
              'Billing Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.inversePrimary,
                errorText: _nameError,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.inversePrimary,
                errorText: _addressError,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _contactController,
              decoration: InputDecoration(
                labelText: 'Contact Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.inversePrimary,
                errorText: _contactError,
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 30),

            // Place Order Button
            Center(
              child: ElevatedButton(
                onPressed: () => _placeOrder(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Place Order',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
