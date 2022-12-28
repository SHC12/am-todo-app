import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:amartha_todo/core/constants/color_constants.dart';
import 'package:amartha_todo/core/utils/responsive.dart';
import 'package:amartha_todo/feature/todo/presentation/widgets/text/custom_text.dart';

showCustomSnackbar({
  required BuildContext context,
  required String text,
  Icon? icon,
  FlushbarPosition position = FlushbarPosition.BOTTOM,
  Duration duration = const Duration(milliseconds: 1500),
  required Color color,
  SnackBarBehavior? behavior,
}) {
  Widget displaySnackBarNormal() {
    return NormalText(
      text: text,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: ColorConstants.white,
      maxLines: 3,
    );
  }

  Widget displaySnackBarWithIcon(Icon icon) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: NormalText(
            text: text,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorConstants.white,
            maxLines: 3,
          ),
        ),
      ],
    );
  }

  bool isMobile = Responsive.isMobile(context);
  if (!Flushbar().isShowing()) {
    Flushbar(
      flushbarPosition: isMobile ? position : FlushbarPosition.TOP,
      animationDuration: const Duration(milliseconds: 500),
      duration: duration,
      borderRadius: BorderRadius.circular(8.r),
      dismissDirection: isMobile ? FlushbarDismissDirection.VERTICAL : FlushbarDismissDirection.HORIZONTAL,
      flushbarStyle: FlushbarStyle.FLOATING,
      margin: isMobile ? EdgeInsets.all(8.r) : EdgeInsets.only(top: 8.h, right: 8.w, left: 1.sw - 0.25.sw),
      messageText: icon == null ? displaySnackBarNormal() : displaySnackBarWithIcon(icon),
      backgroundColor: color,
    ).show(context);
  }
}
