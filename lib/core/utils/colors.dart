import 'package:flutter/material.dart';

class VColor {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  // ignore: unused_element
  VColor._();

  // core color
  static const Color scaffoldBg = Color(0xfff6f8fa);
  static const Color textFieldGrey = Color(0xfff3f3f6);
  static const Color red = Color.fromARGB(255, 255, 91, 79);
  static const Color primaryButton = Color(0xff37325F);
  static const Color secondaryButton = Color(0xff0a2342);
  static const Color searchText = Color(0xff50566A);
  static const Color white = Colors.white;
  static const Color grey = Color(0xfff2f2f2);
  static const Color dark = Color(0xff252525);
  static const Color border = Color(0xffE0E0E0);
  static const Color bottomGrey = Color(0xffD1D1D6);
  static const Color hint = Color(0x55252525);

  // custom color
  static const Color header = Color(0xffF8D8D2);

  static LinearGradient cardShadow() {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.black54, Colors.transparent, Colors.transparent],
    );
  }

  static colorFilterFromColor(Color color) {
    return ColorFilter.mode(color, BlendMode.dstIn);
  }
}
