import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> item = [
    Coffee(
        name: "Black Coffee",
        price: "13,000",
        imagePath: "../lib/images/coffee.png"),
    Coffee(
        name: "Milk Coffee",
        price: "15,000",
        imagePath: "../lib/images/latte-art.png"),
    Coffee(
        name: "Bubble Tea",
        price: "17,000",
        imagePath: "../lib/images/bubble-tea.png"),
    Coffee(
        name: "Green Tea",
        price: "20,000",
        imagePath: "../lib/images/green-tea.png"),
    Coffee(
        name: "Brown Sugar Bubble Fresh Milk",
        price: "22,000",
        imagePath: "../lib/images/brown-sugar.png"),
  ];

  final List<Coffee> _userCart = [];

  List<Coffee> get coffeeShop => item;

  List<Coffee> get userCart => _userCart;

  void addItem(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItem(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
