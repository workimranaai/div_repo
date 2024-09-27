import 'package:cart_craze/screens/product_detail.dart';
import 'package:flutter/material.dart';

class ContainerCategory extends StatelessWidget {
  final String image;
  final String price;
  final String proname;
  final String quantity;

  const ContainerCategory({
    super.key,
    required this.image,
    required this.price,
    required this.proname,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetail()),
          );
        },
        child: Container(
          height: 200,
          width: 350,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 191, 196, 200),
                Color.fromARGB(255, 93, 158, 208)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(15), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
                spreadRadius: 3, // Shadow spread
                blurRadius: 3, // Shadow blur
                offset: const Offset(0, 3), // Shadow position
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  width: 50,
                  height: 50,
                ),
                const SizedBox(height: 10),
                Text(
                  proname,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Quantity: ',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      quantity,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  price,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductContainer extends StatelessWidget {
  String image;
  String price;
  String proname;
  String quantity = "";
  String description = "";

  ProductContainer({
    super.key,
    required this.image,
    required this.price,
    required this.proname,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 350,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 3, // Shadow spread
            blurRadius: 3, // Shadow blur
            offset: const Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            image,
            width: 100,
            height: 120,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  proname,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "\$$price",
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.pinkAccent),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "Add",
              style: TextStyle(
                color: Colors.pinkAccent,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
