import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minimal_ecommerce_app/model/shop_model.dart';
import 'package:minimal_ecommerce_app/screens/cart_screen.dart';
import 'package:minimal_ecommerce_app/screens/checkout_screen.dart';
import 'package:minimal_ecommerce_app/screens/intro_screen.dart';
import 'package:minimal_ecommerce_app/screens/order_history_screen.dart';
import 'package:minimal_ecommerce_app/screens/shop_screen.dart';
import 'package:minimal_ecommerce_app/screens/view_detail_screen.dart';
import 'package:minimal_ecommerce_app/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ShopModel(),
      child: const MinimalEcommerceApp(),
    ),
  );
}

class MinimalEcommerceApp extends StatelessWidget {
  const MinimalEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
      theme: lightMode,
      routes: {
        '/intro_screen': (context) => const IntroScreen(),
        '/shop_screen': (context) => const ShopScreen(),
        '/cart_screen': (context) => const CartScreen(),
        '/detail_screen': (context) => const ViewDetailScreen(),
        '/checkout_screen': (context) => const CheckoutScreen(),
        '/order_history_screen': (context) => const OrderHistoryScreen(),
      },
    );
  }
}
