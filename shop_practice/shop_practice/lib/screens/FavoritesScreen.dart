import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shop_practice/model/Products.dart';
import 'package:shop_practice/screens/HomeScreen.dart';
import 'package:shop_practice/widgets/MainDrawer.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = "/favorites/";
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<Products>(context, listen: false);
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: Column(
        children: [
          if (favorites.getFavoriteItems.isNotEmpty)
            Grid(favorites.getFavoriteItems.toList())
          else
            Container(
              height: 250.0,
              child: Center(
                  child: Text("No favorites",
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold))),
            )
        ],
      ),
    );
  }
}
