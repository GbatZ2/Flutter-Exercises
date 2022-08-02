import 'package:flutter/cupertino.dart';
import 'package:shop_practice/model/Product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
        title: "Nike Shoes",
        amount: 150,
        id: "p1",
        imageUrl:
            "https://cdn.deporvillage.com/cdn-cgi/image/h=576,w=576,dpr=1,f=auto,q=75,fit=contain,background=white/product/as-1011b192402_001.jpg",
        isFavorite: false,
        price: 150),
    Product(
        title: "Adidas Shoes",
        amount: 120,
        id: "p2",
        imageUrl:
            "https://cdn.deporvillage.com/cdn-cgi/image/h=576,w=576,dpr=1,f=auto,q=75,fit=contain,background=white/product/as-1011b192402_001.jpg",
        isFavorite: false,
        price: 200),
    Product(
        title: "Puma Shoes",
        amount: 50,
        id: "p3",
        imageUrl:
            "https://cdn.deporvillage.com/cdn-cgi/image/h=576,w=576,dpr=1,f=auto,q=75,fit=contain,background=white/product/as-1011b192402_001.jpg",
        isFavorite: false,
        price: 50),
    Product(
        title: "Reebok Shoes",
        amount: 10,
        id: "p4",
        imageUrl:
            "https://cdn.deporvillage.com/cdn-cgi/image/h=576,w=576,dpr=1,f=auto,q=75,fit=contain,background=white/product/as-1011b192402_001.jpg",
        isFavorite: false,
        price: 70)
  ];

  List<Product> get getFavoriteItems {
    return _items.where((product) => product.isFavorite!).toList();
  }

  void addProduct(Product prd) {
    _items.add(prd);
    notifyListeners();
  }

  List<Product> getItems() {
    return [..._items];
  }
}
