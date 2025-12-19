import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';

class ProductDetailPage extends StatefulWidget {
  final String name;
  final String price;
  final String oldPrice;
  final String image;
  final List<Map<String, dynamic>> cartItems;

  const ProductDetailPage({
    super.key,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.image,
    required this.cartItems,
  });


  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.name,
          style: TextStyle(
              fontSize: 16
          ),),
        actions: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isOn = !isOn;
                  });
                },
                color: Colors.red,
                iconSize: 20,
                icon: Icon(CupertinoIcons.heart_fill),
                isSelected: isOn,
                selectedIcon: Icon(CupertinoIcons.heart),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(100)),
            child: Icon(
              Icons.share,
              size: 16,
            ),
          ),
          SizedBox(width: 10),
        ],),
      body: Column(
        children: [
          Image.asset(widget.image),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 35,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star,
                            color: Colors.lightBlueAccent,
                            size: 20,),
                          SizedBox(width: 3),
                          Text("4.8",
                            style: TextStyle(
                                fontSize: 16
                            ),),
                          SizedBox(width: 7),
                          Text("117 reviews",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 11
                            ),)
                        ],
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.thumb_up,
                            color: Colors.green,
                            size: 20,),
                          SizedBox(width: 3),
                          Text("94%",
                            style: TextStyle(
                                fontSize: 16
                            ),),

                        ],
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.question_answer,
                            color: Colors.grey,
                            size: 20,),
                          SizedBox(width: 3),
                          Text("8",
                            style: TextStyle(
                                fontSize: 16
                            ),),

                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 45,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Text(widget.price,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(width: 10),
                        Text("from £14 per month",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade700
                          ),),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Text("When buying a product, always pay attention to its key features, the quality of materials, and the warranty. Customer reviews can also give you useful insights before making a final decision. Read more",
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 11
              ),),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () async {
                final cartItem = {
                  "name": widget.name,
                  "price": widget.price,
                  "image": widget.image,
                };

                final updatedCart = List<Map<String, dynamic>>.from(widget.cartItems);
                updatedCart.add(cartItem);

                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(cartItems: updatedCart),
                  ),
                );

                if (result != null && mounted) {
                  setState(() {
                    widget.cartItems.clear();
                    widget.cartItems.addAll(result);
                  });
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(cartItems: updatedCart),
                  ),
                );
              },

              child: Container(
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(192, 218, 70, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'cart_page.dart';
//
// class ProductDetailPage extends StatefulWidget {
//   final String name;
//   final String price;
//   final String oldPrice;
//   final String image;
//   final List<Map<String, dynamic>> cartItems;
//
//   const ProductDetailPage({
//     super.key,
//     required this.name,
//     required this.price,
//     required this.oldPrice,
//     required this.image,
//     required this.cartItems,
//   });
//
//   @override
//   State<ProductDetailPage> createState() => _ProductDetailPageState();
// }
//
// class _ProductDetailPageState extends State<ProductDetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.name)),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Center(
//               child: Image.asset(widget.image),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(widget.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Text(widget.price, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                     SizedBox(width: 10),
//                     Text(
//                       widget.oldPrice,
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey,
//                         decoration: TextDecoration.lineThrough,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       widget.cartItems.add({
//                         "name": widget.name,
//                         "price": widget.price,
//                         "image": widget.image,
//                       });
//                     });
//
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text("${widget.name} added to cart")),
//                     );
//                   },
//                   child: Text("Add to Cart"),
//                 ),
//                 SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => CartPage(cartItems: widget.cartItems),
//                       ),
//                     );
//                   },
//                   child: Text("Go to Cart"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

