import 'package:flutter/material.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/widget/widget.dart';

TextField costumTextfeild({ String? hintText}) {
  return TextField(
    cursorColor: Colors.grey,
    decoration: InputDecoration(
       enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            )),
        hintText: hintText??"",
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            )),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(12))),
  );
}

Container containerBtn({ String? text}) {
  return Container(
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(2, 4),
          )
        ],
        color: ColorConstents.primeryColor,
        borderRadius: BorderRadius.circular(10)),
    width: double.infinity,
    height: 60,
    child: Center(
        child: textStyled(
            text: text??'',
            color: Colors.white,
            fontweight: FontWeight.bold,
            fontSize: 18)),
  );
}
