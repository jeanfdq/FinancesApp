
import 'dart:math';

extension RandomDouble on double {

  static double get () {
    return Random().nextInt(15).toDouble() + 8;
  }

}