import 'package:cart_craze/screens/cart.dart';
import 'package:cart_craze/screens/category.dart';
import 'package:cart_craze/screens/edit_profile.dart';
import 'package:cart_craze/screens/product_detail.dart';
import 'package:cart_craze/screens/setting.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final PageController _controller = PageController(initialPage: 0);
  int _selectedIndex = 0;

  final List<Widget> pages = [
    CartScreen(),
    Category(),
    ProductDetail(),
    EditProfile(),
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
            icon: Icon(Icons.call),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
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