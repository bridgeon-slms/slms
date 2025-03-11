import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/view_model/ReviewController/reviewcontroller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesChartPage extends StatefulWidget {

  const SalesChartPage({super.key,});

  @override
  SalesChartPageState createState() => SalesChartPageState();
}

class SalesChartPageState extends State<SalesChartPage> {
  List<ChartData> data = [];
  late TooltipBehavior _tooltip;
  bool isLoading = true;
  final ScrollController _scrollController = ScrollController();

  static const double barWidth = 50;
  static const double spacingValue = 20;

  @override
  void initState() {
    super.initState();
    _tooltip = TooltipBehavior(enable: true);
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final reviewController = context.read<Reviewcontroller>();
      final List<double> reviewMarks = reviewController.getTotalReviewMArk();

      List<ChartData> apiData =
          List.generate(reviewController.reviewList.length, (index) {
            log(reviewController.reviewList.length.toString());
        double reviewScore =
            (index < reviewMarks.length) ? reviewMarks[index] : 0.0;
        return ChartData('Week ${reviewController.reviewList[index].week}', reviewScore);
      });
      setState(() {
        data = apiData;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load data: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstents.bagroundColor,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Scrollbar(
                controller: _scrollController,
                radius: const Radius.circular(4),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  child: SizedBox(
                    width: data.length * (barWidth + spacingValue),
                    child: _buildChart(),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildChart() {
    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(
        labelRotation: 0,
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: const NumericAxis(minimum: 0, maximum: 40, interval: 10),
      tooltipBehavior: _tooltip,
      series: <CartesianSeries<ChartData, String>>[
        ColumnSeries<ChartData, String>(
          dataSource: data,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          name: 'Sales',
          width: 0.99,
          spacing: 0.4,
          color:
              Colors.transparent, // Ensures pointColorMapper applies correctly
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
