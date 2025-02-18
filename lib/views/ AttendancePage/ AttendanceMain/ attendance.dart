import 'dart:developer';

import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:slms/AttendendsServices/attendencecontroller.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/views/%20AttendancePage/%20AttendanceReport/chartpage.dart';
import 'package:slms/views/%20AttendancePage/%20AttendanceMain/widgets.dart';
import 'package:slms/widget/widget.dart';

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
                        dateContainer(
                          ontap: () async {
                            final date = await showDatePickerDialog(
                              selectableDayPredicate: (DateTime date) => true,
                              context: context,
                              initialDate: DateTime(2022, 10, 10),
                              minDate: DateTime(2020, 10, 10),
                              maxDate: DateTime(2024, 10, 30),
                              width: 300,
                              height: 300,
                              currentDate: DateTime(2022, 10, 15),
                              selectedDate: DateTime(2022, 10, 16),
                              currentDateDecoration: const BoxDecoration(),
                              currentDateTextStyle: const TextStyle(),
                              daysOfTheWeekTextStyle: const TextStyle(),
                              // disbaledCellsDecoration: const BoxDecoration(),
                              disabledCellsTextStyle: const TextStyle(),
                              enabledCellsDecoration: const BoxDecoration(),
                              enabledCellsTextStyle: const TextStyle(),
                              initialPickerType: PickerType.days,
                              selectedCellDecoration: const BoxDecoration(),
                              selectedCellTextStyle: const TextStyle(),
                              leadingDateTextStyle: const TextStyle(),
                              slidersColor: Colors.lightBlue,
                              highlightColor: Colors.redAccent,
                              slidersSize: 20,
                              splashColor: Colors.lightBlueAccent,
                              splashRadius: 40,
                              centerLeadingDate: true,
                            );
                          },
                        ),
                        Gap(10),
                        dateContainer(
                          ontap: () async {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: ColorConstents.bagroundColor,
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
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.blue.shade600,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 22, color: Colors.blue),
          SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.blue),
          ),
        ],
      ),
    ),
  );
}
