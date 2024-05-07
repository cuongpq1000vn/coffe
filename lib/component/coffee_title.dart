// ignore_for_file: prefer_const_constructors

import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CoffeeTitle extends StatelessWidget {
  final Coffee coffee;
  final Icon icon;
  void Function()? onPressed;
  CoffeeTitle(
      {super.key,
      required this.coffee,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[400], borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Text(coffee.price),
        leading: Image.asset(coffee.imagePath),
        trailing: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
