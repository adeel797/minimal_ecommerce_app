import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String name;
  final IconData icon;
  final void Function()? onTap;
  const DrawerListTile({super.key, required this.name, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 20,top: 10.0),
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary
          ),
        ),

        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
        onTap: onTap,
      ),
    );
  }
}
