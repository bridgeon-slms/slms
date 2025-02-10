import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/view/%20AttendancePage/%20AttendanceMain/widgets.dart';
import 'package:slms/widget/widget.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textStyled(text: 'Hi Rinshid'),
                textStyled(
                    text: 'Attendance Report',
                    fontweight: FontWeight.bold,
                    fontSize: 18),
                Gap(20),
                Row(
                  children: [dateContainer(), Gap(10), dateContainer()],
                ),
                Gap(10),
                TabBar(
                  labelColor: ColorConstents.primeryColor,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: ColorConstents.primeryColor,
                  tabs: [
                    Tab(text: "Present"),
                    Tab(text: "Absent"),
                  ],
                ),
                Gap(20),
                Expanded(
                  child: TabBarView(
                    children: [
                      attenceBar(),
                      Center(child: textStyled(text: "Absent Data")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded dateContainer() {
    return Expanded(
      child: Card(
        elevation: 2,
        color: ColorConstents.primeryColor,
        child: SizedBox(
          height: 50,
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
