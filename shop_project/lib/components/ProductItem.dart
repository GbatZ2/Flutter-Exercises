// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_project/providers/ProductsProvider.dart';
import 'package:shop_project/screens/ProductDetailsScreen.dart';

import '../providers/Product.dart';
import '../providers/cart.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    //final item = Provider.of<Product>(context);

    final cart = Provider.of<Cart>(context);

    return Consumer<Product>(
        builder: (BuildContext context, value, Widget? child) => ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: GridTile(
                  footer: GridTileBar(
                    backgroundColor: Colors.black87,
                    leading: IconButton(
                      icon: Icon(
                          value.isFavorite == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Theme.of(context).primaryColorLight),
                      onPressed: () => {value.toggleFavoriteStatus()},
                    ),
                    title: Text(
                      value.title!,
                      textAlign: TextAlign.center,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.shop,
                          color: Theme.of(context).primaryColorLight),
                      onPressed: () => {
                        cart.addItem(value.id!, value.price!, value.title!),
                        ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text("Added item to cart!"),
                            duration: const Duration(seconds: 1),
                            action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  cart.removeSingleItem(value.id!);
                                }),
                          ),
                        )
                      },
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.of(context).pushNamed(
                          ProductsDetailsScreen.routeName,
                          arguments: value.id)
                    },
                    child: Image.network(
                      value.imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  )),
            ));
  }
}
