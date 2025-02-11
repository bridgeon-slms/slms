  import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:slms/widget/widget.dart';

CircularPercentIndicator CirculePercentange() {
    return CircularPercentIndicator(
                    radius: 40.0,
                    lineWidth: 10.0,
                    percent: 0.83,
                    center: textStyled(text: '83%'),
                    progressColor: Colors.blue,
                    backgroundColor: Colors.grey.shade300,
                    circularStrokeCap: CircularStrokeCap.round,
                  );
  }