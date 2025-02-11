import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/views/%20AttendancePage/%20AttendanceReport/chartpage.dart';
import 'package:slms/views/%20AttendancePage/%20AttendanceMain/widgets.dart';
import 'package:slms/widget/widget.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorConstents.bagroundColor,
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
                  children: [
                    dateContainer(ontap: () async {
                      DateTime? selectedStartDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100));
                    }),
                    Gap(10),
                    dateContainer(
                      ontap: () async {
                        DateTime? selectedStartDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100));
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
                    Tab(text: "Present"),
                    Tab(text: "Absent"),
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
