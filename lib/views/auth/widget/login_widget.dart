import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/view_model/auth/auth_controller.dart';
import 'package:slms/widget/widget.dart';

TextField costumTextfeild(
    {String? hintText, TextEditingController? controller}) {
  return TextField(
    controller: controller,
    cursorColor: Colors.grey,
    decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            )),
        hintText: hintText ?? "",
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

Widget containerBtn(
    {String? text, VoidCallback? onTap, required BuildContext context}) {
  bool isLodding = context.watch<AuthenticationController>().isLogging;
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
        child: isLodding
            ? Center(
                child: CircularProgressIndicator(
                  color: ColorConstents.bagroundColor,
                ),
              )
            : textStyled(
                text: text ?? '',
                color: ColorConstents.bagroundColor,
                fontweight: FontWeight.bold,
                fontSize: 18)),
  );
}
