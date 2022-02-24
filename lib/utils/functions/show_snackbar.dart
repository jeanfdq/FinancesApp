
import 'package:flutter/material.dart';

void showSnackBar(
    BuildContext context, {
    required String message,
    bool isSuccessMessage = false,
  }) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: isSuccessMessage ? Colors.green : Colors.red,
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }