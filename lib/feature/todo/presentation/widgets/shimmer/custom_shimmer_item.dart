import 'package:flutter/material.dart';
import 'package:amartha_todo/core/constants/color_constants.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double height;
  final double width;
  final double radius;

  const CustomShimmer({
    Key? key,
    required this.height,
    required this.width,
    this.radius = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white10,
      baseColor: ColorConstants.shadowCardColor,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: ColorConstants.headerTable,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
