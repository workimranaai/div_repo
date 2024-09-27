import 'package:cart_craze/screens/cart.dart';
import 'package:cart_craze/screens/category.dart';
import 'package:cart_craze/screens/customer/customer_home.dart';
import 'package:cart_craze/screens/edit_profile.dart';
import 'package:cart_craze/screens/product_detail.dart';
import 'package:cart_craze/screens/retailer/add_product_screen.dart';
import 'package:cart_craze/screens/retailer/product_portfolio.dart';
import 'package:cart_craze/screens/retailer/retailer_profile.dart';
import 'package:cart_craze/screens/setting.dart';
import 'package:flutter/material.dart';

class CustomerHomeDashboard extends StatefulWidget {
  const CustomerHomeDashboard({super.key});

  @override
  State<CustomerHomeDashboard> createState() => _CustomerHomeDashboardState();
}

class _CustomerHomeDashboardState extends State<CustomerHomeDashboard> {
  final PageController _controller = PageController(initialPage: 0);
  int _selectedIndex = 0;

  final List<Widget> pages = [
    CustomerHome(),
    RetailerProfile(),

  ];



  void _onItemTapped(int index) {
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
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
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