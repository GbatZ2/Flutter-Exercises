import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_project/providers/ProductsProvider.dart';

import '../providers/Product.dart';

class ProductsDetailsScreen extends StatelessWidget {
  static const routeName = "/ProductsDetails";

  const ProductsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;

    final loadedProduct = Provider.of<ProductsProvider>(context, listen: false)
        .filterById(productId);

    return Scaffold(
        appBar: AppBar(
          title: Text(loadedProduct.description!),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 300.0,
                  width: double.infinity,
                  child: Image.network(
                    loadedProduct.imageUrl!,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(height: 10.0),
              Text("\$${loadedProduct.price}",
                  style: const TextStyle(color: Colors.grey, fontSize: 20.0)),
              const SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "\$${loadedProduct.description}",
                  style: const TextStyle(color: Colors.grey, fontSize: 15.0),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ));
  }
}
