import 'package:coffee_shop/component/bottom_nav.dart';
import 'package:coffee_shop/component/cart.dart';
import 'package:coffee_shop/component/shopping.dart';
import 'package:coffee_shop/const/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:string_extensions/string_extensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome Back ${user.email!.substring(0, 4).capitalize}"),
        actions: [
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout))
        ],
      ),
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
