// ignore_for_file: prefer_const_constructors

import 'package:coffee_shop/models/coffee-shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'component/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=> CoffeeShop(),
    builder: (context, child) => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),);
  }
}
