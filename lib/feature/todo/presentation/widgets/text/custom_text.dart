import 'package:flutter/material.dart';

class NormalText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final int? maxLines;
  final TextAlign? textAlign;
  final bool isUnderline;
  final TextOverflow textOverflow;

  const NormalText({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    this.maxLines,
    this.textAlign,
    this.isUnderline = false,
    this.textOverflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      maxLines: maxLines,
      textAlign: textAlign,
      softWrap: false,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        overflow: textOverflow,
        decoration: isUnderline ? TextDecoration.underline : null,
      ),
    );
  }
}
