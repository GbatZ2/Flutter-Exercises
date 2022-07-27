// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_project/providers/ProductsProvider.dart';

import 'ProductItem.dart';

class GridViewProducts extends StatelessWidget {
  final bool showFavs;

  GridViewProducts(this.showFavs);

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final ProductsData = Provider.of<ProductsProvider>(context);
    final items = showFavs ? ProductsData.favoriteItems : ProductsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: items[index], child: ProductItem()),
      itemCount: items.length,
    );
  }
}
