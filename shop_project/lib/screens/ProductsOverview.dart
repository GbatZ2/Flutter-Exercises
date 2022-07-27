import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_project/components/AppDrawer.dart';
import 'package:shop_project/components/badge.dart';
import 'package:shop_project/providers/ProductsProvider.dart';
import 'package:shop_project/screens/CartScreens.dart';

import '../components/GridView.dart';
import '../components/ProductItem.dart';
import '../providers/Product.dart';
import '../providers/cart.dart';

enum FilterOptions { FAVORITES, ALL }

class ProductsOverview extends StatefulWidget {
  @override
  State<ProductsOverview> createState() => _ProductsOverviewState();
}

class _ProductsOverviewState extends State<ProductsOverview> {
  var showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          title: const Text("MyShop"),
          actions: [
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.FAVORITES) {
                    showOnlyFavorites = true;
                  } else {
                    showOnlyFavorites = false;
                  }
                });
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                const PopupMenuItem(
                    value: FilterOptions.FAVORITES,
                    child: Text("Only Favorites")),
                const PopupMenuItem(
                    value: FilterOptions.ALL, child: Text("Show All")),
              ],
            ),
            Consumer<Cart>(
                builder: (_, cartData, ch) => Badge(
                    value: cartData.itemCount.toString(),
                    color: Theme.of(context).primaryColor,
                    child: ch),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                ))
          ],
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: GridViewProducts(showOnlyFavorites));
  }
}
