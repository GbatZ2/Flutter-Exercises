// @dart=2.9
import 'package:flutter/material.dart';
import 'package:shop_project/providers/Orders.dart';
import 'package:shop_project/providers/ProductsProvider.dart';
import 'package:shop_project/providers/cart.dart';
import 'package:shop_project/screens/CartScreens.dart';
import 'package:shop_project/screens/EditProductScreen.dart';
import 'package:shop_project/screens/OrdersScreen.dart';
import 'package:shop_project/screens/ProductDetailsScreen.dart';
import 'package:shop_project/screens/ProductsOverview.dart';
import 'package:provider/provider.dart';
import 'package:shop_project/screens/UserProductsScreen.dart';

void main() => runApp(ShopApp());

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'ShopApp',
        theme: ThemeData(
            primaryColor: const Color(0xffCA4E79),
            primaryColorDark: const Color(0xff4C3A51),
            primaryColorLight: const Color(0xffE7AB79),
            appBarTheme: const AppBarTheme(backgroundColor: Color(0xffCA4E79))),
        home: ProductsOverview(),
        routes: {
          ProductsDetailsScreen.routeName: (ctx) =>
              const ProductsDetailsScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => const UserProductsScreen(),
          EditProductScreen.routeName: (ctx) => const EditProductScreen(),
        },
      ),
    );
  }
}
