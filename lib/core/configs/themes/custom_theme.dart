import 'package:amartha_todo/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  final ThemeData light = ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: ColorConstants.primary,
    backgroundColor: ColorConstants.white,
    dividerColor: Colors.white54,
  );

  final ThemeData customLight = ThemeData(
    fontFamily: 'NunitoSans',
    primarySwatch: ColorConstants.materialPrimary,
    brightness: Brightness.light,
    dividerTheme: const DividerThemeData(
      thickness: 0.2,
      color: ColorConstants.outlineColor,
    ),
    primaryColor: ColorConstants.primary,
    backgroundColor: ColorConstants.white,
    dividerColor: Colors.white54,
  );

  final ThemeData dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: ColorConstants.primary,
    backgroundColor: ColorConstants.dark,
    dividerColor: Colors.black12,
  );
}
