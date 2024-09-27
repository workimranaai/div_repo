import 'package:cart_craze/bloc/customer_bloc/get_product_screen/get_product_bloc.dart';
import 'package:cart_craze/utils/container_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerHome extends StatefulWidget {
  const CustomerHome({super.key});

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 177, 207, 243),
        title: Text(
          'Products',
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: BlocBuilder<GetProductsBloc, GetProductState>(
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: List.generate(4, (index) {
                        // Generate 4 items
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductContainer(
                            proname: 'Chocolate Cookies',
                            image: 'assets/images/cart3.png',
                            price: '56',
                            description: 'short description about the product',
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
