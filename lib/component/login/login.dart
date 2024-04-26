import "package:coffee_shop/component/login/input_form.dart";
import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // make the component avoid notch phone area
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
                width: 20,
              ),
              Icon(
                Icons.coffee,
                size: 100,
              ),
              SizedBox(
                height: 20,
                width: 20,
              ),
              Text(
                "Welcome to Bang Lang's coffee shop",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
                width: 20,
              ),
              // input form
              InputText(hintText: "Enter your username", obscureText: false)
            ],
          ),
        ),
      ),
    );
  }
}
