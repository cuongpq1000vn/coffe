import "package:coffee_shop/models/coffee-shop.dart";
import "package:coffee_shop/pages/home.dart";
import "package:coffee_shop/pages/login.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return LoginPage();
            }
            return ChangeNotifierProvider(
                create: (context) => CoffeeShop(), child: const HomePage());
          }),
    );
  }
}
