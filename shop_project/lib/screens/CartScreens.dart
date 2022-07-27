import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_project/providers/Orders.dart';
import 'package:shop_project/providers/cart.dart';
import '../components/CartItem.dart' as ci;

class CartScreen extends StatelessWidget {
  static const routeName = "/CartScreen";
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Chip(
                      label: Text(
                        "\$${cart.totalAmount.toStringAsFixed(2)}",
                        style: const TextStyle(
                            color: Color(0xffEEEEEE),
                            fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Provider.of<Orders>(context, listen: false).addOrder(
                              cart.items.values.toList(), cart.totalAmount);

                          cart.clear();
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(0.0),
                        ),
                        child: const Text(
                          "Order Now",
                        ))
                  ]),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
              child: cart.itemCount > 0
                  ? ListView.builder(
                      itemCount: cart.itemCount,
                      itemBuilder: (ctx, i) => ci.CartItem(
                            cart.items.values.toList()[i].id,
                            cart.items.keys.toList()[i],
                            cart.items.values.toList()[i].price,
                            cart.items.values.toList()[i].quantity,
                            cart.items.values.toList()[i].title,
                          ))
                  : Container())
        ],
      ),
    );
  }
}
