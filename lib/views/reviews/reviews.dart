import 'package:flutter/material.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/widget/widget.dart';

class Reviewspage extends StatelessWidget {
  const Reviewspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstents.bagroundColor,
      appBar: AppBar(
        surfaceTintColor: ColorConstents.bagroundColor,
        backgroundColor: ColorConstents.bagroundColor,
        title: textStyled(
            text: 'Review Report', fontSize: 16, fontweight: FontWeight.bold),
      ),
    );
  }
}
