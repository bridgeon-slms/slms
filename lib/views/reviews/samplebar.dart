import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

          final List<ChartData> data = List.generate(
            reviewController.reviewList.length,
            (index) {
              double reviewScore =
                  (index < reviewController.getTotalReviewMArk().length)
                      ? reviewController.getTotalReviewMArk()[index]
                      : 0.0;
              return ChartData(
                  'Week ${reviewController.reviewList[index].week}',
                  reviewScore);
            },
          );

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: data.length * (barWidth + spacingValue),
                child: SalesChart(data),
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
  const SalesChart(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(
        labelRotation: 0,
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: const NumericAxis(minimum: 0, maximum: 40, interval: 10),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<ChartData, String>>[
        ColumnSeries<ChartData, String>(
          dataSource: data,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          name: 'Sales',
          width: 0.99,
          spacing: 0.4,
          color: Colors.transparent,
          pointColorMapper: (ChartData data, _) => _getPointColor(data.y),
        ),
      ],
    );
  }

  Color _getPointColor(double value) {
    if (value >= 35) return Colors.green;
    if (value >= 30) return Colors.yellow;
    if (value >= 25) return Colors.orange;
    return Colors.red;
  }
}

class ChartData {
  final String x;
  final double y;
  ChartData(this.x, this.y);
}
