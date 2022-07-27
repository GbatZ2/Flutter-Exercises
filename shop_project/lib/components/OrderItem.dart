import 'dart:math';

import 'package:flutter/material.dart';
import '../providers/Orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  // ignore: use_key_in_widget_constructors
  const OrderItem(
    this.order,
  );

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: Text("\$${widget.order.amount}"),
            subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                height: min(widget.order.products!.length * 20 + 10, 100),
                child: ListView(
                  children: widget.order.products!
                      .map((product) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.title,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${product.quantity}x \$${product.price}',
                                style: const TextStyle(
                                    fontSize: 18.0, color: Colors.grey),
                              )
                            ],
                          ))
                      .toList(),
                )),
        ],
      ),
    );
  }
}
