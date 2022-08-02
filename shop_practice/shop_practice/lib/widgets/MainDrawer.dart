import 'package:flutter/material.dart';
import 'package:shop_practice/screens/AddEditProducts.dart';
import 'package:shop_practice/screens/FavoritesScreen.dart';
import 'package:shop_practice/screens/HomeScreen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
              automaticallyImplyLeading: false,
              title: const Text("Shoe App", style: TextStyle(fontSize: 30.0))),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.of(context).pushNamed(HomeScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Favorites"),
            onTap: () {
              Navigator.of(context).pushNamed(FavoriteScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.create),
            title: const Text("Add Products"),
            onTap: () {
              Navigator.of(context).pushNamed(AddEditProducts.routeName);
            },
          ),
        ],
      ),
    );
  }
}
