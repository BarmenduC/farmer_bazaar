import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import '../../../providers/order.dart';

class OrderItemss extends StatefulWidget {
  final OrderItem order;
  OrderItemss({required this.order});

  @override
  State<OrderItemss> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItemss> {
  var expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height:
            expanded ? min(widget.order.products.length * 20 + 90, 200) : 75,
        child: Card(
          elevation: 0,
          color: Colors.blue[100],
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              ListTile(
                title: Text('Order amount: ${widget.order.amount}'),
                subtitle: Text(
                    '' //                DateFormat('dd/MM/yyyy - hh:mm').format(widget.order.dateTime),
                    ),
                trailing: IconButton(
                  icon: Icon(!expanded ? Icons.expand_more : Icons.expand_less),
                  onPressed: () {
                    setState(() {
                      expanded = !expanded;
                    });
                  },
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: expanded
                    ? min(widget.order.products.length * 20.0 + 10, 120)
                    : 0,
                child: ListView(
                  children: widget.order.products
                      .map(
                        (prod) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              prod.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${prod.quantity} x \$ ${prod.price}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
