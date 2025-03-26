import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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


Widget loddingWidget(){
  return Container(
    color: Colors.white,
    child: Center(child: Lottie.asset('assets/animation/Animation - 1732086805692.json',width: 300,)));
}