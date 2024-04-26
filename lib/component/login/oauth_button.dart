import "package:flutter/material.dart";

class OauthLogin extends StatelessWidget {
  final String imagePath;
  const OauthLogin({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Image.asset(
        imagePath,
        height: 50,
      ),
    );
  }
}
