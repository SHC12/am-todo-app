import 'package:amartha_todo/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static var h6 = const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    fontFamily: 'NunitoSans',
  );
  static var h5 = const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    fontFamily: 'NunitoSans',
  );
  static var h4 = const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    fontFamily: 'NunitoSans',
  );

  static var h3 = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    fontFamily: 'NunitoSans',
  );

  static var h2 = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'NunitoSans',
  );

  static var h1 = const TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
    fontFamily: 'NunitoSans',
  );
  static var h0 = const TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'NunitoSans',
  );
}

class FormStyle {
  static var inputStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: ColorConstants.outlineColor,
  );
  static TextStyle normalTextStyle = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400);
  static TextStyle errorTextStyle = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400);

  static var inputDecorationStyle = const InputDecoration(
    hintStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    ),
    // contentPadding: EdgeInsets.all(20.0),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorConstants.outline,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
      gapPadding: 8,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorConstants.primary,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFF070E4E),
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorConstants.primary,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
    ),
  );
}
