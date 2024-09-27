// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cart_craze/screens/carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
 final imageUrls = [
    'assets/images/cart_1.jpg',
    'assets/images/cart2.jpg',
    'assets/images/cart1.png',
    'assets/images/cart2.png',
    'assets/images/cart3.jpg',
    'assets/images/cart_1.jpg',
    'assets/images/cart2.jpg',
    'assets/images/cart2.png',
    'assets/images/cart3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        appBar: AppBar(
        title: Text(
          'Product detail',
           style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
         CarouselSlider.builder(
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrls[index]), // Use AssetImage here
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
        options: CarouselOptions(
          height: 200,
          aspectRatio: 15 / 8,
          viewportFraction: 0.95,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 700),
          enlargeCenterPage: true,
          enlargeFactor: 0.8  ,
          reverse: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
  
  
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10,right: 20),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    top: 5,
                  ),
                  child: Text(
                    'Jacobs Cream Crackers',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ 10',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 19,
                          ),
                        ),
                        Text(
                          '200 g',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(15),
                        //boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.5), // Shadow color
                        //     spreadRadius: 4, // How much the shadow spreads
                        //     blurRadius: 4,   // Softness of the shadow
                        //     offset: Offset(0, 3), // Position of the shadow (x, y)
                        //   ),
                        // ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/images/add.png',
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(width: 7,),
                          Container(
                            width: 25,
                            height: 27,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.black, width: 2),
                              shape: BoxShape.rectangle,
                            ),
                            child: Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                                                    SizedBox(width: 6,),

                          Image.asset(
                            'assets/images/minus.png',
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        top: 10,

                      ),
                      child: Text(
                        'Product Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10, bottom: 15,right: 5),
              child: Text(
                ' Weight: 200gCream CrackersNo Sugar AddedLight, Crispy Crackers',
                style: TextStyle(
                  color: Color(0xFF616161),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    top: 10,
                  ),
                  child: Text(
                    'Nutritional values',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10, bottom: 15,right: 5),
              child: Text(
                'Volutpat nam diam in turpis. Dignissim massa eleifend amet est elit adipiscing. Habitant ut massa rhoncus aliquam tortor. Diam eget nullam maecenas porta enim diam platea mauris adipiscing.',
                style: TextStyle(
                  color: Color(0xFF616161),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
