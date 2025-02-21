import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:slms/model/AttendanceModel/AttendanceModels/model.dart';
import 'package:slms/model/AttendanceModel/logModel/logmodel.dart';
import 'package:slms/services/AttendendsServices/attendencecontroller.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/widget/widget.dart';

int last = 0;

Widget attenceBar({required BuildContext context}) {
  return Consumer<Attendencecontroller>(
    builder: (context, value, child) => SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      textStyled(text: '10 Feb 2025', fontSize: 18),
                      Gap(25),
                      textStyled(text: 'Status', fontSize: 18),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.attendenceList.length,
                      itemBuilder: (context, index) {
                        return cd(
                          index: index,
                          // date: value.attendenceLogList[index],
                          list: value.attendenceList[index],
                          context: context,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

GestureDetector cd(
    {required BuildContext context,
    required Data list,
    AttendanceLogs? date,
    required int index}) {
  return GestureDetector(
    onTap: () {
      showMaterialModalBottomSheet(
        backgroundColor: ColorConstents.bagroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        bounce: true,
        elevation: 2,
        context: context,
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 2 + 250,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
              child: Consumer<Attendencecontroller>(
                builder: (context, checkvalue, child) {
                  String targetDate =
                      checkvalue.changeDateForListing(list.date).toString();

                  List<AttendanceLogs> filteredLogs = checkvalue
                      .attendenceLogList
                      .where((log) =>
                          checkvalue
                              .changeDateForListing(log.logDate)
                              .toString() ==
                          targetDate)
                      .toList();

                  int inCount =
                      filteredLogs.where((log) => log.direction == 'in').length;
                  int outCount = filteredLogs
                      .where((log) => log.direction == 'out')
                      .length;

                  filteredLogs.sort((a, b) {
                    if (a.logDate != null && b.logDate != null) {
                      return a.logDate!.compareTo(b.logDate!);
                    }
                    return 0;
                  });

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textStyled(
                        text: 'Attendance Report  ',
                        fontweight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      Gap(20),
                      cardCheakinOut(
                          name: 'CheckIn',
                          date: list.date != null
                              ? checkvalue.cheackinTake(list.checkIn)
                              : 'no date'),
                      Gap(10),
                      cardCheakinOut(
                          name: 'CheckOut',
                          date: list.date != null
                              ? checkvalue.cheackOut(list.checkOut)
                              : 'no date'),
                      Gap(10),
                      Row(
                        children: [
                          Expanded(
                            child: cardCheakinOut(
                                name: 'Work Time',
                                date: list.workTime != null
                                    ? checkvalue
                                        .workTimeTotelInHour(list.workTime)
                                    : 'no data'),
                          ),
                          Expanded(
                            child: cardCheakinOut(
                                name: 'Total',
                                date: list.totalTime != null
                                    ? checkvalue
                                        .workTimeTotelInHour(list.totalTime)
                                    : 'no data'),
                          ),
                        ],
                      ),
                      Gap(20),
                      textStyled(
                        text: "Attendance Details",
                        fontweight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      Gap(10),
                      Expanded(
                        child: GridView.builder(
                          itemCount: filteredLogs.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 3.0,
                          ),
                          itemBuilder: (context, index) {
                            var logEntry = filteredLogs[index];

                            return Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: logEntry.direction == 'in'
                                        ? const Color.fromARGB(
                                            255, 101, 209, 104)
                                        : const Color.fromARGB(
                                            255, 226, 79, 68),
                                  ),
                                  child: Center(
                                    child: textStyled(
                                      text:
                                          '${logEntry.direction}- ${checkvalue.cheackinTake(logEntry.logDate.toString())}',
                                      fontweight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      );
    },
    child: Consumer<Attendencecontroller>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                textStyled(
                  text: list.date != null
                      ? value.changeDateForListing(list.date)
                      : 'nodate',
                ),
                Spacer(),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Divider(),
                )),
                Spacer(),
                list.status == 1
                    ? containerForAttendts(color: Colors.green, text: 'Present')
                    : list.status == 2
                        ? containerForAttendts(
                            color: Colors.yellow, text: 'Late')
                        : list.status == 3
                            ? containerForAttendts(
                                color: Colors.orange, text: 'Half Day')
                            : list.status == 4
                                ? containerForAttendts(
                                    color:
                                        const Color.fromARGB(255, 231, 103, 94),
                                    text: 'Excused')
                                : list.status == 5
                                    ? containerForAttendts(
                                        color: Colors.red, text: 'Unexcused')
                                    : containerForAttendts(
                                        color: Colors.grey, text: 'No Status')
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Card cardCheakinOut({required String name, required String date}) {
  return Card(
    color: Colors.white,
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          textStyled(text: name, fontweight: FontWeight.bold),
          textStyled(text: '-'),
          textStyled(text: date),
        ],
      ),
    ),
  );
}

List<Color> colorForAttentends = [
  Color.fromARGB(255, 94, 207, 98),
  Color.fromARGB(255, 241, 74, 63),
];

List<String> textForAttends = ['In 8:42 AM', 'Out 9:50 AM'];

Widget containerForAttendts({required Color color, required String text}) {
  return Container(
    height: 35,
    width: 120,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: color),
    ),
    child: Center(child: textStyled(text: text, color: Colors.white)),
  );
}
