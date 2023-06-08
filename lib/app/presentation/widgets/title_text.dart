import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      this.fontSize = 16,
      this.fontWeight = FontWeight.normal,
      this.color = AppColors.titleBlack});
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontFamily: "neueplak"),
    );
  }
}
