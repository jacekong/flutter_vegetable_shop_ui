import 'package:final_exam/pages/account.dart';
import 'package:final_exam/pages/cart.dart';
import 'package:final_exam/pages/home_page.dart';
import 'package:final_exam/pages/willist.dart';
import 'package:flutter/material.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _HomePageState();
}

class _HomePageState extends State<BottomNav> {

  // navigate the bottom bar
  int _selectedIndex = 0;
  void bottomNavigator(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

final List<Widget> _children = [
  const HomePage(),
  CartPage(),
  WillList(),
  const AccountPage(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      //body
      body: _children[_selectedIndex],
      //Bottom Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Will',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Account',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: bottomNavigator,
        type: BottomNavigationBarType.fixed,
      ),
    );
  } }//ec