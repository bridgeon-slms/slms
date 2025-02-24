import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sales_graph/flutter_sales_graph.dart';
import 'package:provider/provider.dart';
import 'package:slider_bar_chart/slider_bar_chart.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/view_model/ReviewController/reviewcontroller.dart';

class Samplebar extends StatelessWidget {
  const Samplebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstents.bagroundColor,
      body: SafeArea(
          child: Consumer<Reviewcontroller>(
        builder: (context, value, child) => Column(
          children: [
            Center(
              child: FlutterSalesGraph(
                salesData: [100, 200, 150, 300, 250, 350],
                labels: ['Week1', 'Week1', 'Week1', 'Week1', 'Week1', 'Week1'],
                maxBarHeight: 250.0,
                barWidth: 60.0,
                colors: [Colors.blue, Colors.green, Colors.red],
                dateLineHeight: 20.0,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
