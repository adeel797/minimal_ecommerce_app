import 'package:flutter/cupertino.dart';
import 'package:minimal_ecommerce_app/model/product_model.dart';

class ShopModel extends ChangeNotifier {
  // list of shoe for sale
  final List<ProductModel> _shopList = [
    ProductModel(
      name: "Product 1",
      price: 1500,
      imagePath: "assets/images/watch.png",
      description:
      "The Description of shoe.Its quality, size, color, and many more.The Description of shoe.Its quality, size, color, and many moreThe Description of shoe.Its quality, size, color, and many moreThe Description of shoe.Its quality, size, color, and many moreThe Description of shoe.Its quality, size, color, and many moreThe Description of shoe.Its quality, size, color, and many moreThe Description of shoe.Its quality, size, color, and many moreThe Description of shoe.Its quality, size, color, and many more",
    ),
    ProductModel(
      name: "Product 2",
      price: 1800,
      imagePath: "assets/images/glasses.png",
      description:
      "The Description of shoe.Its quality, size, color, and many more.",
    ),
    ProductModel(
      name: "Product 3",
      price: 2200,
      imagePath: "assets/images/hoddie.png",
      description:
      "The Description of shoe.Its quality, size, color, and many more.",
    ),
    ProductModel(
      name: "Product 4",
      price: 3000,
      imagePath: "assets/images/bracelet.png",
      description:
      "The Description of shoe.Its quality, size, color, and many more.",
    ),
    ProductModel(
      name: "Product 5",
      price: 3500,
      imagePath: "assets/images/watch.png",
      description:
      "The Description of shoe.Its quality, size, color, and many more.",
    ),
    ProductModel(
      name: "Product 6",
      price: 3500,
      imagePath: "assets/images/glasses.png",
      description:
      "The Description of shoe.Its quality, size, color, and many more.",
    ),
    ProductModel(
      name: "Product 7",
      price: 3500,
      imagePath: "assets/images/hoddie.png",
      description:
      "The Description of shoe.Its quality, size, color, and many more.",
    ),
    ProductModel(
      name: "Product 8",
      price: 3500,
      imagePath: "assets/images/bracelet.png",
      description:
      "The Description of shoe.Its quality, size, color, and many more.",
    ),
  ];

  // list of items in user cart
  final List<ProductModel> _userCart = [];

  // list of order history
  final List<Map<String, dynamic>> _orderHistory = [];

  // get product list
  List<ProductModel> get shopList => _shopList;

  // get user cart list
  List<ProductModel> get userCart => _userCart;

  // get order history
  List<Map<String, dynamic>> get orderHistory => _orderHistory;

  // add item to cart
  void addItemToCart(ProductModel item) {
    _userCart.add(item);
    print('Item added: ${item.name}, Cart size: ${_userCart.length}'); // Debug print
    notifyListeners();
  }

  // remove item to cart
  void removeItemToCart(ProductModel item) {
    _userCart.remove(item);
    notifyListeners();
  }

  // clear cart
  void clearCart() {
    _userCart.clear();
    notifyListeners();
  }

  // add order to history
  void addOrder(List<ProductModel> items, double total, String paymentMethod) {
    _orderHistory.add({
      'items': List.from(items), // Create a copy of items
      'total': total,
      'paymentMethod': paymentMethod,
      'date': DateTime.now(),
    });
    notifyListeners();
  }
}