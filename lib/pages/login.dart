// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:coffee_shop/component/login/button.dart";
import "package:coffee_shop/component/login/input_form.dart";
import "package:coffee_shop/component/login/oauth_button.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void wrongEmailMessage() {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('Incorrect Email, Try Again'),
            );
          });
    }

    void wrongPasswordMessage() {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('Incorrect Password, Try Again'),
            );
          });
    }

    void signIn() async {
      showDialog(
          context: context,
          builder: (context) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.black12,
            ));
          });
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        Navigator.pop(context);
      } on FirebaseAuthException catch (exception) {
        Navigator.pop(context);
        if (exception.code == 'invalid-email') {
          wrongEmailMessage();
        } else if (exception.code == 'invalid-credential') {
          wrongPasswordMessage();
        }
      }
    }

    return Scaffold(
      // make the component avoid notch phone area
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                  "Welcome to Bang Lang's Coffee Shop",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                // input form
                InputText(
                    hintText: "Email",
                    obscureText: false,
                    controller: emailController),
                SizedBox(height: 20),
                InputText(
                    hintText: "Password",
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
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OauthLogin(imagePath: "lib/images/facebook.png"),
                    const SizedBox(
                      width: 25,
                    ),
                    OauthLogin(imagePath: "lib/images/google.png")
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account?", style: TextStyle(fontSize: 16)),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Register now", style: TextStyle(fontSize: 16))
                  ],
                ),
                SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
