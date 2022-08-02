import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:shop_practice/model/Product.dart';
import 'package:shop_practice/model/Products.dart';
import 'package:shop_practice/screens/AddEditProducts.dart';
import 'package:shop_practice/screens/FavoritesScreen.dart';
import 'package:shop_practice/screens/HomeScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Product()),
        ChangeNotifierProvider.value(value: Products())
      ],
      child: MaterialApp(
          title: "Shop",
          theme: ThemeData(
              primarySwatch: Colors.lime,
              colorScheme: ColorScheme.fromSwatch().copyWith(
                secondary: Colors.cyan, // Your accent color
              ),
              appBarTheme: const AppBarTheme(backgroundColor: Colors.cyan)),
          home: const HomeScreen(),
          routes: {
            AddEditProducts.routeName: (ctx) => const AddEditProducts(),
            FavoriteScreen.routeName: (ctx) => const FavoriteScreen()
          }),
    );
  }
}

//**
//MultiProviders -> Provider
//*/ */