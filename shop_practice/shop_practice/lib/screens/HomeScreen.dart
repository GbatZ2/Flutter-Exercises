// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_practice/model/Product.dart';
import 'package:shop_practice/model/Products.dart';
import 'package:shop_practice/widgets/MainDrawer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<Products>(context, listen: false).getItems();
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text("Shoe Shop"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
            child: Text("Products",
                style: TextStyle(
                    fontSize: 50.0, color: Color.fromARGB(190, 0, 0, 0))),
          ),
          Grid(items)
        ],
      ),
    );
  }
}

class CardItem extends StatefulWidget {
  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridTile(
        child: Image.network(
          product.imageUrl.toString(),
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Color.fromARGB(20, 0, 0, 0),
        ),
        footer: GridTileBar(
            backgroundColor: Colors.black38,
            title: Text(
              product.title.toString(),
            ),
            trailing: Consumer<Product>(
                builder: ((context, value, _) => IconButton(
                      icon: Icon(product.isFavorite!
                          ? Icons.favorite
                          : Icons.favorite_border),
                      onPressed: () {
                        product.toggleFavorite();
                      },
                    )))),
      ),
    );
  }
}

class Grid extends StatelessWidget {
  final List<Product> items;
  const Grid(this.items, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: items[i],
        child: CardItem(),
      ),
      itemCount: items.length,
    ));
  }
}
