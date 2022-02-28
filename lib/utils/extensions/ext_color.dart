import 'dart:math';

import 'package:flutter/material.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension RandomColor on Color {
  static List<Color> get({int? max}) {
    const List<Color> availableColors = [
      Colors.purpleAccent,
      Colors.yellow,
      Colors.lightBlue,
      Colors.orange,
      Colors.pink,
      Colors.brown,
      Colors.blueGrey,
      Colors.lightGreen,
      Colors.teal,
      Colors.cyan,
    ];

    final List<Color> listColor = [];

    final maxColor = max ?? 10;

    var count = 0;

    while (true) {
      final color = availableColors[Random().nextInt(availableColors.length)];

      if (!listColor.contains(color)) {
        listColor.add(color);

        if (count == maxColor - 1) {
          break;
        }
        count++;
      }
      // do some things
    }

    return listColor;
  }
}
