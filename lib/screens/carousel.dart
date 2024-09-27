
import 'package:cart_craze/utils/my_buttons.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final imageUrls = [
    'assets/images/cart_1.jpg',
    'assets/images/cart_1.jpg',
    'assets/images/cart_1.jpg',
    'assets/images/cart_1.jpg',
    'assets/images/cart_1.jpg',
    'assets/images/cart_1.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Image Slider",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body:
      
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
              borderRadius: BorderRadius.circular(25),
            ),
          );
        },
        options: CarouselOptions(
          height: 170,
          aspectRatio: 16 / 8,
          viewportFraction: 0.8,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 700),
          enlargeCenterPage: true,
          enlargeFactor: 0.5,
          reverse: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
  
  
    );
  }
}
