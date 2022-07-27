import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_project/components/AppDrawer.dart';
import 'package:shop_project/providers/ProductsProvider.dart';
import 'package:shop_project/screens/EditProductScreen.dart';

import '../components/UserProductItem.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = "/UserProductsScreen";
  const UserProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ProductsProvider>(context);

    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: const Text('Your Products'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(EditProductScreen.routeName);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: data.items.length,
              itemBuilder: ((_, index) => UserProductItem(data.items[index].id!,
                  data.items[index].title!, data.items[index].imageUrl!))),
        ));
  }
}
