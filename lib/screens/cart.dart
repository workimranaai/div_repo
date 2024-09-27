import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, String>> _cartItems = [
    {
      'name': 'Jacobs Cream Crackers',
      'gram': '450gm',
      'price': '₵ 20',
      'image': 'assets/images/cart2.png',
    },  
    {
      'name': 'Pran Treat Chocolate',
      'gram': '580gm',
      'price': '₵ 90',
      'image': 'assets/images/cart3.png',
    },
    {
      'name': 'Mokate Rainbow Cookie',
      'gram': '600gm',
      'price': '₵ 60',
      'image': 'assets/images/cart1.png',
    },
     {
      'name': 'Pran Treat Chocolate',
      'gram': '580gm',
      'price': '₵ 90',
      'image': 'assets/images/cart3.png',
    },
    {
      'name': 'Mokate Rainbow Cookie',
      'gram': '600gm',
      'price': '₵ 60',
      'image': 'assets/images/cart1.png',
    },
     {
      'name': 'Pran Treat Chocolate',
      'gram': '580gm',
      'price': '₵ 90',
      'image': 'assets/images/cart3.png',
    },
    {
      'name': 'Mokate Rainbow Cookie',
      'gram': '600gm',
      'price': '₵ 60',
      'image': 'assets/images/cart1.png',
    },
     {
      'name': 'Pran Treat Chocolate',
      'gram': '580gm',
      'price': '₵ 90',
      'image': 'assets/images/cart3.png',
    },
    {
      'name': 'Mokate Rainbow Cookie',
      'gram': '600gm',
      'price': '₵ 60',
      'image': 'assets/images/cart1.png',
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: Text('Cart'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = _cartItems[index];
                return Padding(
                  padding: EdgeInsets.all(5),
                  child: GestureDetector(
                    child: Container(
                      height: 95,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                cartItem['image']!, 
                                width: 60,
                                height: 70,
                              ),
                              SizedBox(height: 20, width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItem['name']!, 
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    cartItem['gram']!, 
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    cartItem['price']!, 
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 2,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
