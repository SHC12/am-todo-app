import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Responsive extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;

  const Responsive({
    Key? key,
    @required this.mobile,
    @required this.tablet,
  }) : super(key: key);

  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 600;

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);

    if (isMobile) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      ScreenUtil.init(
        context,
        designSize: const Size(375, 812),
        minTextAdapt: true,
      );
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
      ScreenUtil.init(
        context,
        designSize: const Size(1024, 768),
        minTextAdapt: true,
      );
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isMobile) {
          return mobile!;
        } else {
          return tablet!;
        }
      },
    );
  }
}
