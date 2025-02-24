import 'package:flutter/material.dart';

Widget textStyled(
    {required String text,
    int? maxline,
    TextOverflow? textoverflow,
    FontWeight? fontweight,
    double? fontSize,
    FontStyle? fontStyle,
    Color? color}) {
  return Text(text,
      maxLines: maxline,
      overflow: textoverflow,
      style: TextStyle(
          fontWeight: fontweight,
          fontSize: fontSize,
          fontStyle: fontStyle,
          color: color));
}
