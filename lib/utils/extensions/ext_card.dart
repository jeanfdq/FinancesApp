import 'package:flutter/material.dart';

extension RoundedCard on Card {
  static Widget get(BuildContext context, double height,
      {Color backgroundColor = Colors.white, double? width, Widget? child}) {
    final widthBox = width ?? MediaQuery.of(context).size.width;

    return SizedBox(
        height: height,
        width: widthBox,
        child: Card(
          color: backgroundColor,
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              child: child,
        ));
  }
}
