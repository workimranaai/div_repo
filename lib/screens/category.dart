import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/container_category.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                backgroundColor:Color.fromARGB(255, 177, 207, 243),
        title: Text(
          'Category',
          
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
        color:Colors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
               //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 10,bottom: 0),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 10,bottom: 0),
                  child: Text(
                    'View All',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      // color: Color(0xFF6859CD),
                      fontSize: 16,
                    ),
                  ),
                ),
               
              ],
            ),
          Expanded( 
            
              child: ListView(
                children: List.generate(4, (index) { // Generate 4 items
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ContainerCategory(
                      proname: 'Chocolate Cookies ${index + 1}', 

                      image: 'assets/images/cart3.png', 
                      price: '\$56', 
                      quantity: '22',
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
