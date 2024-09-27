import 'package:cart_craze/screens/retailer/product_portfolio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/authentication/get_product_screen/get_product_bloc.dart';
import '../../bloc/retailer_add_product/retailer_add_product_bloc.dart';

class GetPortfolio extends StatefulWidget {
  const GetPortfolio({super.key});

  @override
  State<GetPortfolio> createState() => _GetPortfolioState();
}

class _GetPortfolioState extends State<GetPortfolio> {
  @override
  void initState() {
    super.initState();
    context.read<GetProductBloc>().add(FetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Softer background color
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove AppBar shadow
        title: Text(
          'Product Portfolio',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.add, color: Colors.black),
              iconSize: 33.0,
              onPressed: () async {
                var flag = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPortfolio(),
                  ),
                );
                if (flag != null) {
                  context.read<GetProductBloc>().add(FetchProducts());
                }
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetProductBloc, GetProductState>(
        builder: (context, state) {
          if (state is GetProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetProductSuccess) {
            final products = state.products;

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        final product = products[0];

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        product['productimage'] ?? 'assets/images/food.jpg',
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product['productName'] ?? 'No Product',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          product['productDetail'] ?? 'No Details',
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          '\$${product['productPrice'] ?? 'No Price'}',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
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
          } else if (state is GetProductError) {
            return const Center(child: Text('Failed to load products'));
          } else {
            return const Center(child: Text('No products available'));
          }
        },
      ),
    );
  }
}
