import 'package:flutter/material.dart';
import 'package:flutter_sales_graph/flutter_sales_graph.dart';
import 'package:provider/provider.dart';
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
              child:
                  Consumer<Reviewcontroller>(builder: (context, value, child) {
                final data =
                    value.reviewList.map((e) => "week${e.week}").toList();
                return FlutterSalesGraph(
                  salesData: value.getTotalReviewMArk(),
                  labels: data,
                  maxBarHeight: 250.0,
                  barWidth: 60.0,
                  colors: value
                      .getTotalReviewMArk()
                      .map((e) => e >= 32
                          ? Colors.green
                          : e > 28
                              ? Colors.yellow
                              : Colors.orange)
                      .toList(),
                );
              }),
            ),
          ],
        ),
      )),
    );
  }
}
