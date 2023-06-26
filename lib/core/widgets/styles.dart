import 'package:flutter/material.dart';

import '../utils/colors.dart';

class VStyle {
  static BoxDecoration boxShadow({
    Color color = VColor.white,
    double radius = 8.0,
    Color? shadowColor,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: shadow(color: shadowColor),
    );
  }

  static BoxDecoration boxShadowOutline(
      {color = VColor.white, radius = 16.0, borderColor = Colors.grey}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor),
      boxShadow: shadow(),
    );
  }

  static shadow({Color? color}) {
    return [BoxShadow(blurRadius: 8.0, color: color ?? Colors.black12)];
  }

  static BoxDecoration corner({radius = 12.0, color}) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius), color: color);
  }

  static InputDecoration whiteBoxSearch({
    required String hintText,
    required void Function() onClear,
    double corner = 24.0,
    bool useSuffix = false,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(0.0),
      hintText: hintText,
      hintStyle: const TextStyle(color: VColor.searchText, fontSize: 14.0),
      prefixIcon: const Icon(Icons.search, color: VColor.searchText),
      filled: true,
      fillColor: VColor.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(corner),
        borderSide: BorderSide.none,
      ),
      suffixIcon: useSuffix
          ? InkWell(
              onTap: onClear,
              child: Container(
                margin: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: VColor.hint,
                ),
                child: const Icon(
                  Icons.clear,
                  color: VColor.searchText,
                  size: 12.0,
                ),
              ),
            )
          : const SizedBox(),
    );
  }

  static InputDecoration boxSearch({
    required String hintText,
    required void Function() onClear,
    double corner = 24.0,
    bool useSuffix = false,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(0.0),
      hintText: hintText,
      hintStyle: const TextStyle(
        color: VColor.searchText,
        fontSize: 14.0,
      ),
      prefixIcon: const Hero(
        tag: 'search',
        child: Icon(Icons.search, color: VColor.searchText),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(corner),
      ),
      labelStyle: const TextStyle(color: VColor.searchText),
      suffixIcon: useSuffix
          ? InkWell(
              onTap: onClear,
              child: Container(
                margin: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: VColor.scaffoldBg,
                ),
                child: const Icon(
                  Icons.clear,
                  color: VColor.searchText,
                  size: 12.0,
                ),
              ),
            )
          : null,
    );
  }

  static BoxDecoration roundedOutline(
      {color = VColor.grey, radius = 16.0, borderColor = VColor.grey}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor),
    );
  }
}
