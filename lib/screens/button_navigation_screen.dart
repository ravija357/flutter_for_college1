import 'package:flutter/material.dart';
import 'package:flutter_for_college/screens/buttom_screen/about_screen.dart';
import 'package:flutter_for_college/screens/buttom_screen/cart_screen.dart';
import 'package:flutter_for_college/screens/buttom_screen/home_screen.dart';
import 'package:flutter_for_college/screens/buttom_screen/profile_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  List<Widget> lstBottomScreen = [
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
    const AboutScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom-Navigation"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 239, 250, 115),
      ),
      body: lstBottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
        ],
        backgroundColor: Colors.black,
        selectedItemColor: const Color.fromARGB(255, 72, 103, 255),
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}