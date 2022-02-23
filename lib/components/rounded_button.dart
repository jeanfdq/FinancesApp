
import 'package:flutter/material.dart';

class ButtonRounded extends StatelessWidget {
  const ButtonRounded({
    Key? key,
    
    required this.label,
    required this.buttonBackgroundColor,
    required this.width,
    required this.callback,
    this.labelColor = Colors.white,
  
  }) : super(key: key);
  
  final String label;
  final Color labelColor;
  final Color buttonBackgroundColor;
  final double width; 
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: callback,
      child: Text(
        label,
        style: TextStyle(
          color: labelColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateColor.resolveWith((states) => buttonBackgroundColor),
        elevation: MaterialStateProperty.all(12),
        fixedSize: MaterialStateProperty.all(Size(width, 52)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(26))),
      ),
    );
  }
}