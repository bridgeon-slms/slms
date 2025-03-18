import 'package:flutter/material.dart';

Widget textStyled(
    {required String text,
    bool? softwrap,
    int? maxline,
    TextOverflow? textoverflow,
    FontWeight? fontweight,
    double? fontSize,
    FontStyle? fontStyle,
    Color? color}) {
  return Text(text,
      maxLines: maxline,
      overflow: textoverflow,
      softWrap: softwrap,
      style: TextStyle(
          fontWeight: fontweight,
          fontSize: fontSize,
          fontStyle: fontStyle,
          color: color));
}
