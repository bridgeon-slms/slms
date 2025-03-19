import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/view_model/auth/auth_controller.dart';
import 'package:slms/views/widget/widget.dart';

TextFormField costumTextfeild(
    {String? hintText,
    TextEditingController? controller,
    String? validationText,
    TextInputType? type}) {
  return TextFormField(
    obscureText: type == TextInputType.visiblePassword? true:false,
    keyboardType: type,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return validationText;
      }
    return null;
    },
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
