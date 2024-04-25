import 'package:coffee_shop/component/bottom_nav.dart';
import 'package:coffee_shop/component/cart.dart';
import 'package:coffee_shop/component/shopping.dart';
import 'package:coffee_shop/const/const.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomNav(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[selected],
    );
  }

  final List<Widget> _pages = [
    const ShoppingPage(),
    const CartPage(),
  ];
  int selected = 0;
  void navigateBottomBar(int index) {
    setState(() {
      selected = index;
    });
  }
}
