// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:coffee_shop/component/coffee_title.dart';
import 'package:coffee_shop/models/coffee-shop.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeItem(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItem(coffee);
  }

  void orderNow() {}
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
          child: Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  Text(
                    'Your Cart',
                    style: TextStyle(fontSize: 20),
                  ),

                  // list of cart
                  Expanded(
                      child: ListView.builder(
                    itemCount: value.userCart.length,
                    itemBuilder: (BuildContext context, int index) {
                      Coffee eachCoffee = value.userCart[index];
                      return CoffeeTitle(
                          coffee: eachCoffee,
                          onPressed: () => removeItem(eachCoffee),
                          icon: Icon(Icons.delete));
                    },
                  )),
                  GestureDetector(
                      onTap: orderNow,
                      child: Container(
                        padding: EdgeInsets.all(25),
                        width: double.infinity,
                        child: Center(
                            child: Text(
                          "Order Now",
                          style: TextStyle(color: Colors.white),
                        )),
                        decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(12)),
                      ))
                ],
              ))),
    );
  }
}
