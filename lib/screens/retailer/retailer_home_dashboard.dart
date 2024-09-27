import 'package:cart_craze/screens/cart.dart';
import 'package:cart_craze/screens/category.dart';
import 'package:cart_craze/screens/edit_profile.dart';
import 'package:cart_craze/screens/product_detail.dart';
import 'package:cart_craze/screens/retailer/add_product_screen.dart';
import 'package:cart_craze/screens/retailer/product_portfolio.dart';
import 'package:cart_craze/screens/retailer/retailer_profile.dart';
import 'package:cart_craze/screens/setting.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'get_portfolio.dart';

class RetailerHomeDashboard extends StatefulWidget {
  const RetailerHomeDashboard({super.key});

  @override
  State<RetailerHomeDashboard> createState() => _RetailerHomeDashboardState();
}

class _RetailerHomeDashboardState extends State<RetailerHomeDashboard> {
  final PageController _controller = PageController(initialPage: 0);
  int _selectedIndex = 0;

  final List<Widget> pages = [
    GetPortfolio(),
    ProductPortfolio(),

  ];



  void _onItemTapped(int index)async {
    setState(() {
      _selectedIndex = index;
    });
    // Update the body of the Scaffold with the PageView
    _controller.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.padding),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Edit Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}