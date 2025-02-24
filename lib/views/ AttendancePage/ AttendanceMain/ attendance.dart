import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:slms/services/AttendendsServices/attendencecontroller.dart';
import 'package:slms/utils/color/color.dart';
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
    // TODO: implement initState
    super.initState();
    Provider.of<Attendencecontroller>(context, listen: false)
        .getAllDataFromAttendence();
    Provider.of<Attendencecontroller>(context, listen: false)
        .getAllDataFromAttendenceLog();

    Provider.of<Attendencecontroller>(context, listen: false).last30Days();
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
                  return Center(child: CircularProgressIndicator());
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
                        Gap(10),
                        dateContainer(
                          ontap: () async {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
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
                                              Icons.calendar_today, () {}),
                                          filterDateButton("Last 7 days",
                                              Icons.date_range, () {}),
                                          filterDateButton("Last 30 days",
                                              Icons.event_note, () {}),
                                          filterDateButton(
                                              "Today", Icons.today, () {}),
                                          filterDateButton("Yesterday",
                                              Icons.history, () {}),
                                          filterDateButton("This Week",
                                              Icons.view_week, () {}),
                                          filterDateButton("Last Week",
                                              Icons.arrow_back, () {}),
                                          filterDateButton("This Month",
                                              Icons.calendar_month, () {}),
                                          filterDateButton("Last Month",
                                              Icons.calendar_view_month, () {}),
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

  GestureDetector dateContainer({VoidCallback? ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Card(
        elevation: 2,
        color: ColorConstents.primeryColor,
        child: SizedBox(
          height: 50,
          width: 200,
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
    );
  }
}

Widget filterDateButton(String text, IconData icon, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.blue.shade600,
        elevation: 3, // Adds a slight shadow effect
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
