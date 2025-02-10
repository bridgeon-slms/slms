import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashbordGraph extends StatefulWidget {
  const DashbordGraph({super.key});

  @override
  State<DashbordGraph> createState() => _DashbordGraphState();
}

class _DashbordGraphState extends State<DashbordGraph> {
  final List<Color> gradientColors = [
    Colors.blue,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 18,
          left: 12,
          top: 24,
          bottom: 12,
        ),
        child: LineChart(mainData()),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    switch (value.toInt()) {
      case 1:
        return SideTitleWidget(
            meta: meta, child: const Text('Week 1', style: style));
      case 2:
        return SideTitleWidget(
            meta: meta, child: const Text('Week 2', style: style));
      case 3:
        return SideTitleWidget(
            meta: meta, child: const Text('Week 3', style: style));
      case 4:
        return SideTitleWidget(
            meta: meta, child: const Text('Week 4', style: style));
      default:
        return Container();
    }
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    switch (value.toInt()) {
      case 1:
        return Text('3', style: style, textAlign: TextAlign.left);
      case 3:
        return Text('7', style: style, textAlign: TextAlign.left);
      case 5:
        return Text('10', style: style, textAlign: TextAlign.left);
      default:
        return Container();
    }
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        verticalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.blue,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(
            width: 0.5, color: const Color.fromARGB(255, 36, 82, 119)),
      ),
      minX: 1,
      maxX: 4,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(1, 3),
            FlSpot(2, 5),
            FlSpot(3, 4),
            FlSpot(4, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  // ignore: deprecated_member_use
                  .map((color) => color.withOpacity(0.3)) // Fixed opacity
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
