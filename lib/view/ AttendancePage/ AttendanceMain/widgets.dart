import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:slms/widget/widget.dart';

Widget attenceBar() {
  return Container(
    width: double.infinity,
    child: Column(
      children: [
        Row(
          children: [
            textStyled(text: '10 Feb 2025', fontSize: 18),
            textStyled(text: 'Status', fontSize: 18),
          ],
        )
      ],
    ),
  );
}
