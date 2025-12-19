import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart",
        style: TextStyle(
          fontWeight: FontWeight.w600
        ),),
        actions: [
          IconButton(
              icon: Icon(CupertinoIcons.delete),
              onPressed: () {
                setState(() {
                  widget.cartItems.clear();
                });

                Navigator.pop(context, widget.cartItems);
              })
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context, widget.cartItems);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final item = widget.cartItems[index];
          return ListTile(
            leading: Image.asset(item['image'], height: 40),
            title: Text(item['name']),
            subtitle: Text(item['price']),
          );
        },
      ),
    );
  }
}
