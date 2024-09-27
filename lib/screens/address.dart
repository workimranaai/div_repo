// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddresssScreen extends StatefulWidget {
  const AddresssScreen({super.key});

  @override
  State<AddresssScreen> createState() => _AddresssScreenState();
}

class _AddresssScreenState extends State<AddresssScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Address Book',
         style: TextStyle(
                                color: Color(0xFF1F1754),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              ),
      ),
      body: Stack(
        children: [
      
          ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 10,),
                child: Center(
                  child: Container(
                    height: 170,
                      decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2.0), // Blue border
                            borderRadius: BorderRadius.circular(10.0), // Optional: rounding corners
                          ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 13, top: 13),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4,right: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Home',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Default address',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF7162D1),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Josh Residency, Plot no.21,'),
                          Text('La-Bawaleshi Rd,'),
                          Text('Accra, Ghana,'),
                          Text('171011'),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'assets/images/edit.png',
                                  width: 25,
                                  height: 25,
                                ),
                                SizedBox(width: 10), // Spacing between icons
                                Image.asset(
                                  'assets/images/trash.png',
                                  width: 25,
                                  height: 25,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                  ),
                          
                ),
              );
            },
          ),
          SizedBox(height: 20,),
       Positioned(
        left: 250,
        right: 0,
        bottom: 20,
      child:    Image.asset('assets/images/plus-circle.png',
      width: 60,
      height: 60,),
       ),
        ],
      ),

    );
  }
}
