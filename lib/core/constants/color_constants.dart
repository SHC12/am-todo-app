import 'package:flutter/material.dart';

class ColorConstants {
  static const Color primary = Color(0xFF7c50a2);
  static const Color white = Color(0xFFFFFFFF);
  static const Color dark = Color(0xFF222222);
  static const Color blueBackground = Color(0xFFF1F9FF);

  // Color by styleguid in figma
  static const Color black = Color(0xFF163A50);
  static const Color purple = Color(0xFFDDBB47);
  static const Color green = Color(0xFF38A169);
  static const Color darkBlue = Color(0xFF0f5a99);
  static const Color blue = Color(0xFF0097c5);
  static const Color yellow = Color(0xFFF59500);
  static const Color red = Color(0xFFF85C5B);
  static const Color headerTable = Color(0xFFF6F7F8);
  static const Color headerTableDarker = Color(0xFFE6E7E8);
  static const Color iconColor = Color(0xFF8999A5);
  static const Color outlineColor = Color(0xFFA1AEB7);
  static const Color outline = Color(0xFFA1AEB7);
  static const Color divider = Color(0xFFECEFF1);
  static const Color dividerDarker = Color(0xFFDCDFE1);
  static const Color shadowCardColor = Color(0xFFEDF2F7);
  static const Color outlineGrey = Color(0xFFD7D8DA);
  static const Color outlineCheckbox = Color(0xFFE4E2E2);

  static const MaterialColor materialPrimary = MaterialColor(
    0xFF7c50a2,
    <int, Color>{
      50: primary,
      100: primary,
      200: primary,
      300: primary,
      400: primary,
      500: primary,
      600: primary,
      700: primary,
      800: primary,
      900: primary,
    },
  );
}
