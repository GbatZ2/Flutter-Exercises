import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_project/components/AppDrawer.dart';
import '../components/OrderItem.dart' as ord;
import '../providers/Orders.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          title: Text("Your Orders"),
        ),
        body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (context, index) =>
              ord.OrderItem(orderData.orders[index]),
        ));
  }
}
