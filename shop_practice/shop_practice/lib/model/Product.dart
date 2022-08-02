import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  String? id = DateTime.now().toString();
  final String? title;
  int? amount = 0;
  double? price = 20;
  String? imageUrl;
  bool? isFavorite = false;

  Product(
      {this.id,
      this.title,
      this.amount,
      this.price,
      this.imageUrl,
      this.isFavorite});

  void toggleFavorite() {
    isFavorite = !isFavorite!;
    notifyListeners();
  }
}
