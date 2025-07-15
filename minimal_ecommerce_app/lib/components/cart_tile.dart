import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/model/product_model.dart';
import 'package:minimal_ecommerce_app/model/shop_model.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final ProductModel productModel;

  const CartTile({super.key, required this.productModel});


  void removeItemFromCart(BuildContext context){
    Provider.of<ShopModel>(context,listen: false).removeItemToCart(productModel);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: Image.asset(productModel.imagePath),
        title: Text(
          productModel.name,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "Rs.${productModel.price.toStringAsFixed(2)}",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        trailing: IconButton(
          onPressed:()=> removeItemFromCart(context),
          icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}