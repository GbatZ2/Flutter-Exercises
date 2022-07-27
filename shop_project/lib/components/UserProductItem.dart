// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_project/providers/ProductsProvider.dart';
import 'package:shop_project/screens/EditProductScreen.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String image;
  final String id;

  const UserProductItem(this.id, this.title, this.image);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(image),
      ),
      trailing: Row(mainAxisSize: MainAxisSize.min, //Here, add this line

          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(EditProductScreen.routeName, arguments: id);
                },
                icon: Icon(Icons.edit, color: Theme.of(context).primaryColor)),
            IconButton(
                onPressed: () {
                  Provider.of<ProductsProvider>(context, listen: false)
                      .deleteProduct(id);
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ))
          ]),
    );
  }
}
