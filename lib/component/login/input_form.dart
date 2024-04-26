import "package:flutter/material.dart";

class InputText extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const InputText(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: hintText,
            filled: true,
            fillColor: Colors.grey.shade200),
        obscureText: obscureText,
      ),
    );
  }
}
