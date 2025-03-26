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
    Color(0xFF4CAF50), // Present (Modern Green)
    Color(0xFFFFC107), // Late (Modern Yellow)
    Color(0xFFFF9800), // Half Day (Modern Orange)
    Color(0xFFFF5722), // Excused (Modern Deep Orange)
    Color(0xFFF44336), // Unexcused (Modern Red)
    Color(0xFF9E9E9E), // No Status (Modern Grey)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstents.bagroundColor,
        title: Text(
          "Attendance Overview",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black87),
        ),
        elevation: 0,
      ),
      backgroundColor: ColorConstents.bagroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<Attendencecontroller>(
                builder: (context, value, child) {
                  var datas =
                      value.attendenceList.map((e) => e.status).toList();

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

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            "Attendance Summary",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                          const Gap(20),
                          PieChart(
                            dataMap: dataMap,
                            colorList: colorList,
                            chartRadius:
                                MediaQuery.of(context).size.width / 2.2,
                            chartValuesOptions: ChartValuesOptions(
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                              decimalPlaces: 1,
                              chartValueStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                            legendOptions: LegendOptions(
                              showLegends: true,
                              legendPosition: LegendPosition.bottom,
                              legendShape: BoxShape.circle,
                              legendTextStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            animationDuration: Duration(milliseconds: 800),
                            chartType: ChartType.ring,
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
      ),
    );
  }
}
