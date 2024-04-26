// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:coffee_shop/component/login/button.dart";
import "package:coffee_shop/component/login/input_form.dart";
import "package:coffee_shop/component/login/oauth_button.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    void signIn() async {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: usernameController.text,
                password: passwordController.text);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }

    return Scaffold(
      // make the component avoid notch phone area
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              SizedBox(height: 20),
              // input form
              InputText(
                  hintText: "Enter your username",
                  obscureText: false,
                  controller: usernameController),
              SizedBox(height: 20),
              InputText(
                  hintText: "Enter your password",
                  obscureText: true,
                  controller: passwordController),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              MyButton(
                onSubmit: signIn,
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    )),
                    Text("Or Sign In with", style: TextStyle(fontSize: 16)),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    )),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OauthLogin(imagePath: "../lib/images/facebook.png"),
                  const SizedBox(
                    width: 25,
                  ),
                  OauthLogin(imagePath: "../lib/images/google.png")
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account?", style: TextStyle(fontSize: 16)),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Register now", style: TextStyle(fontSize: 16))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
