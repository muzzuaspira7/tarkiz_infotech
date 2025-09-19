import 'package:flutter/material.dart';
import 'package:tarkiz_infotech/core/utils/screen_utils.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final double? letterSpacing;
  final int? maxLines;
  final TextOverflow? overflow;

  const AppText(
    this.text, {
    super.key,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'notosans',
        fontSize: fontSize.sp, 
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing?.sp,
      ),
    );
  }
}
