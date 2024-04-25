// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:coffee_shop/component/coffee_title.dart';
import 'package:coffee_shop/models/coffee-shop.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItem(coffee);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Add to cart successfully !!!"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "How would you like your coffee ?",
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                        child: ListView.builder(
                            itemCount: value.item.length,
                            itemBuilder: (context, index) {
                              Coffee item = value.coffeeShop[index];
                              return CoffeeTitle(
                                coffee: item,
                                onPressed: () => addToCart(item),
                                icon: Icon(Icons.add),
                              );
                            }))
                  ],
                ))));
  }
}
