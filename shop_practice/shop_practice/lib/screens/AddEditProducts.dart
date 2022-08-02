import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shop_practice/model/Product.dart';
import 'package:shop_practice/model/Products.dart';
import 'package:shop_practice/widgets/MainDrawer.dart';

class AddEditProducts extends StatelessWidget {
  static const routeName = "/add_edit_products";

  const AddEditProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Product"),
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0),
        child: Column(children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: "Enter a title"),
          ),
          SizedBox(height: 40.0),
          ElevatedButton(
              onPressed: () => Provider.of<Products>(context, listen: false)
                  .addProduct(Product(
                      title: titleController.text,
                      isFavorite: false,
                      imageUrl:
                          'https://cdn.deporvillage.com/cdn-cgi/image/h=576,w=576,dpr=1,f=auto,q=75,fit=contain,background=white/product/as-1011b192402_001.jpg')),
              child: Text("Enter a Product"))
        ]),
      ),
    );
  }
}
