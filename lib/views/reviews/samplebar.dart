import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/model/ReviewModel/review.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/view_model/ReviewController/reviewcontroller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesChartPage extends StatelessWidget {
  const SalesChartPage({super.key});

  static const double barWidth = 50;
  static const double spacingValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstents.bagroundColor,
      body: Consumer<Reviewcontroller>(
        builder: (context, reviewController, child) {
          if (reviewController.reviewList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<double> reviewMarks =
              reviewController.getTotalReviewMArk()[0];
          final List<double> otherMArk =
              reviewController.getTotalReviewMArk()[1];
          final List<ChartData> data = [];
          print(reviewMarks);
          for (int index = 0;
              index < reviewController.reviewList.length;
              index++) {
            if (index < reviewMarks.length) {
              String weekLabel =
                  'Week ${reviewController.reviewList[index].week}';
              double percentage =
                  (reviewMarks[index] * 0.7 + otherMArk[index] * 0.3) /
                      20 *
                      100;
              data.add(ChartData(weekLabel, percentage));
            }
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: data.length * (barWidth + spacingValue),
                child: SalesChart(
                  data,
                  reviewController.reviewList,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SalesChart extends StatelessWidget {
  final List<ChartData> data;
  final List<ReviewData> reviewList;

  const SalesChart(this.data, this.reviewList, {super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      enableAxisAnimation: true,
      primaryXAxis: CategoryAxis(
        labelRotation: 0,
        majorGridLines: const MajorGridLines(width: 0),
        arrangeByIndex: true,
      ),
      primaryYAxis: const NumericAxis(minimum: 0, maximum: 100, interval: 20),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<ChartData, String>>[
        ColumnSeries<ChartData, String>(
          animationDuration: 500,
          dataSource: data,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          name: 'Review (%)',
          width: 0.6,
          spacing: 0.4,
          pointColorMapper: (ChartData data, index) =>
              _getPointColor(data.y, index),
        ),
      ],
    );
  }

  Color _getPointColor(double value, int index) {
    bool hasWeekBack = reviewList[index].isWeekBack ?? false;
    if (hasWeekBack) return Colors.red;
    if (value >= 80) return Colors.green;
    if (value >= 70) return Colors.yellow;
    if (value <= 60) return Colors.orange;

    return Colors.grey;
  }
}

class ChartData {
  final String x;
  final double y;
  ChartData(this.x, this.y);
}
