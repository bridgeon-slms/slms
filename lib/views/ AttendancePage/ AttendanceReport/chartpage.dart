import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/view_model/attendence/attendencecontroller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    DateTime time = DateTime.now();
    String startDate = DateFormat('yyyy-MM-dd').format(time);
    DateTime yesterday = time.subtract(Duration(days: 5));
    String endDate = DateFormat('yyyy-MM-dd').format(yesterday);

    Provider.of<Attendencecontroller>(context, listen: false)
        .getAllDataFromAttendence(endDate, startDate);
  }

  final List<Color> colorList = [
    Colors.green,
    Colors.orange,
    Colors.blue,
    Colors.red,
    Colors.purple,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstents.bagroundColor,
        title: Text(
          "Attendance Overview",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: ColorConstents.bagroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<Attendencecontroller>(
              builder: (context, value, child) {
                var datas = value.attendenceList.map((e) => e.status).toList();

                var present = datas.where((e) => e == 1).length;
                var late = datas.where((e) => e == 2).length;
                var halfDay = datas.where((e) => e == 3).length;
                var excused = datas.where((e) => e == 4).length;
                var unexcused = datas.where((e) => e == 5).length;
                var noStatus = datas.where((e) => e == 6).length;

                final Map<String, double> dataMap = {
                  "Present": present.toDouble(),
                  "Late": late.toDouble(),
                  "Half Day": halfDay.toDouble(),
                  "Excused": excused.toDouble(),
                  "Unexcused": unexcused.toDouble(),
                  "No Status": noStatus.toDouble(),
                };

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          "Attendance Summary",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const Gap(15),
                        PieChart(
                          dataMap: dataMap,
                          colorList: colorList,
                          chartRadius: MediaQuery.of(context).size.width / 2.5,
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true,
                            showChartValuesOutside: false,
                            decimalPlaces: 1,
                            chartValueStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          legendOptions: const LegendOptions(
                            showLegends: true,
                            legendPosition: LegendPosition.bottom,
                            legendShape: BoxShape.circle,
                            legendTextStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
