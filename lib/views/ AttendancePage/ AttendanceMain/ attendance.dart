import 'dart:developer';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/view_model/attendence/attendencecontroller.dart';
import 'package:slms/views/%20AttendancePage/%20AttendanceReport/chartpage.dart';
import 'package:slms/views/%20AttendancePage/%20AttendanceMain/widgets.dart';
import 'package:slms/views/widget/widget.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  void initState() {
    log('attendence init state calling');
    super.initState();
    DateTime time = DateTime.now();
    String startDate = DateFormat('yyyy-MM-dd').format(time);
    DateTime yesterday = time.subtract(Duration(days: 5));
    String endate = DateFormat('yyyy-MM-dd').format(yesterday);
    Provider.of<Attendencecontroller>(context, listen: false)
        .getAllDataFromAttendence(endate, startDate);
    Provider.of<Attendencecontroller>(context, listen: false)
        .getAllDataFromAttendenceLog();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorConstents.bagroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Consumer<Attendencecontroller>(
              builder: (context, datas, child) {
                if (datas.attendenceList.isEmpty) {
                  return Center(child: loddingWidget());
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textStyled(
                        text: 'Hi ${datas.attendenceList.first.userId?.name}'),
                    textStyled(
                        text: 'Attendance Report',
                        fontweight: FontWeight.bold,
                        fontSize: 18),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Consumer<Attendencecontroller>(
                          builder: (context, value, child) => dateContainer(
                            ontap: () async {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  String? formattedStartDate;
                                  String? formattedEndDate;
                                  return AlertDialog(
                                    backgroundColor:
                                        ColorConstents.bagroundColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    title: Column(
                                      children: [
                                        Text(
                                          "Select The Date",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        Divider(thickness: 1),
                                      ],
                                    ),
                                    content: SizedBox(
                                      width: 320,
                                      height: 350,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            CalendarDatePicker2(
                                              config: CalendarDatePicker2Config(
                                                calendarType:
                                                    CalendarDatePicker2Type
                                                        .range,
                                              ),
                                              value: datas.selectedDates,
                                              onValueChanged: (dates) {
                                                datas.updateDates(dates);

                                                if (dates.isNotEmpty) {
                                                  DateTime startDate =
                                                      dates.first;
                                                  DateTime? endDate =
                                                      dates.length > 1
                                                          ? dates.last
                                                          : null;

                                                  formattedStartDate =
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(startDate);
                                                  formattedEndDate = endDate !=
                                                          null
                                                      ? DateFormat('yyyy-MM-dd')
                                                          .format(endDate)
                                                      : null;
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text(
                                          "CLOSE",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          value.getAllDataFromAttendence(
                                              formattedStartDate,
                                              formattedEndDate);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Ok",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Gap(10),
                        Consumer<Attendencecontroller>(
                          builder: (context, value, child) => dateContainer(
                            ontap: () async {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor:
                                        ColorConstents.bagroundColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    title: Column(
                                      children: [
                                        Text(
                                          "Select The Date",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        Divider(thickness: 1),
                                      ],
                                    ),
                                    content: SizedBox(
                                      width: 320,
                                      height: 350,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            filterDateButton("Show all",
                                                Icons.calendar_today, () {
                                              DateTime time = DateTime.now();
                                              String startDate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(time);
                                              var a = value.getLast
                                                  .map((e) => e.date)
                                                  .toList();
                                              var last = a.last;
                                              DateTime newCheckInTime =
                                                  DateTime.parse(
                                                          last.toString())
                                                      .toUtc();

                                              var endDate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(newCheckInTime);
                                              log(startDate);
                                              log(endDate);

                                              value.getAllDataFromAttendence(
                                                  endDate, startDate);
                                              // ser
                                            }),
                                            filterDateButton(
                                                "Last 7 days", Icons.date_range,
                                                () {
                                              DateTime time = DateTime.now();
                                              String startDate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(time);
                                              DateTime yesterday = time
                                                  .subtract(Duration(days: 7));
                                              String endate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(yesterday);

                                              value.getAllDataFromAttendence(
                                                  endate, startDate);
                                            }),
                                            filterDateButton("Last 30 days",
                                                Icons.event_note, () {
                                              DateTime time = DateTime.now();
                                              String startDate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(time);
                                              DateTime yesterday = time
                                                  .subtract(Duration(days: 30));
                                              String endate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(yesterday);

                                              value.getAllDataFromAttendence(
                                                  endate, startDate);
                                            }),
                                            filterDateButton("This Month",
                                                Icons.calendar_month, () {
                                              DateTime now = DateTime.now();

                                              DateTime firstDayOfMonth =
                                                  DateTime(
                                                      now.year, now.month, 1);

                                              DateTime lastDayOfMonth =
                                                  DateTime(now.year,
                                                      now.month + 1, 0);

                                              String startDate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(firstDayOfMonth);
                                              String endDate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(lastDayOfMonth);

                                              value.getAllDataFromAttendence(
                                                  startDate, endDate);
                                            }),
                                            filterDateButton("Last Month",
                                                Icons.calendar_view_month, () {
                                              DateTime now = DateTime.now();

                                              DateTime firstDayOfMonth =
                                                  DateTime(now.year,
                                                      now.month - 1, 1);

                                              DateTime lastDayOfMonth =
                                                  DateTime(
                                                      now.year, now.month, 0);

                                              String startDate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(firstDayOfMonth);
                                              String endDate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(lastDayOfMonth);

                                              value.getAllDataFromAttendence(
                                                  startDate, endDate);
                                            }),
                                          ],
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text(
                                          "CLOSE",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    Gap(10),
                    TabBar(
                      labelColor: ColorConstents.primeryColor,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: ColorConstents.primeryColor,
                      tabs: [
                        Tab(
                          icon: Icon(Icons.list),
                        ),
                        Tab(
                          icon: Icon(Icons.incomplete_circle),
                        ),
                      ],
                    ),
                    Gap(20),
                    Expanded(
                      child: TabBarView(
                        children: [
                          attenceBar(context: context),
                          Center(
                            child: Dashboard(),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Expanded dateContainer({VoidCallback? ontap}) {
    return Expanded(
      child: GestureDetector(
        onTap: ontap,
        child: Card(
          elevation: 2,
          color: ColorConstents.primeryColor,
          child: SizedBox(
            height: 50,
            // width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textStyled(
                    text: 'Select Date',
                    fontweight: FontWeight.bold,
                    color: Colors.white),
                Gap(5),
                Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget filterDateButton(String text, IconData icon, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: ColorConstents.primeryColor,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 22, color: Colors.white),
          SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
