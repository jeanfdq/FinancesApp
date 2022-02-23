
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.keyboard = TextInputType.name,
    this.isSecurity = false,
    this.textCapitalization = TextCapitalization.words,
    required this.width,
    required this.hint,
    required this.controller,
  }) : super(key: key);

  final double width;
  final TextInputType keyboard;
  final String hint;
  final bool isSecurity;
  final TextCapitalization textCapitalization;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: width,
      child: TextField(
        keyboardAppearance: Brightness.light,
        keyboardType: keyboard,
        textCapitalization: textCapitalization,
        obscureText: isSecurity,
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            filled: true,
            hintStyle: const TextStyle(color: Colors.grey),
            hintText: hint,
            fillColor: Colors.white),
      ),
    );
  }
}