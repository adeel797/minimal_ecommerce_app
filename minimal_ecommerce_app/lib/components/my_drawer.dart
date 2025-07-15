import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/drawer_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 10,
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              // drawer header logo
              Padding(
                padding: const EdgeInsets.only(
                  top: 50.0,
                  left: 25.0,
                  right: 25.0,
                  bottom: 10.0,
                ),
                child: Container(
                  color: Theme.of(context).colorScheme.background,
                  child: Center(
                    child: Icon(
                      Icons.shopping_bag,
                      size: 86,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),

              // shop
              DrawerListTile(
                name: "S H O P",
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              // cart
              DrawerListTile(
                name: "C A R T",
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart_screen');
                },
              ),

              // order history
              DrawerListTile(
                name: "O D E R S",
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/order_history_screen');
                },
              ),
            ],
          ),

          // logout
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: ListTile(
              title: Text(
                "E X I T",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.primary,
              ),
              onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/intro_screen', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
