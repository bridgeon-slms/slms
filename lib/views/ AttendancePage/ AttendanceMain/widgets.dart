import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:slms/AttendanceModel/AttendanceModels/model.dart';
import 'package:slms/AttendendsServices/attendencecontroller.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/widget/widget.dart';

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

GestureDetector cd({
  required BuildContext context,
  required Data list,
}) {
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
                builder: (context, value, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textStyled(
                      text: 'Attendance Report',
                      fontweight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    Gap(20),
                    cardCheakinOut(
                        name: 'CheckIn',
                        date: list.date != null
                            ? value.cheackinTake(list.checkIn)
                            : 'no date'),
                    Gap(10),
                    cardCheakinOut(
                        name: 'CheckOut',
                        date: list.date != null
                            ? value.cheackOut(list.checkOut)
                            : 'no date'),
                    Gap(10),
                    Row(
                      children: [
                        Expanded(
                          child: cardCheakinOut(
                              name: 'Work Time',
                              date: list.workTime != null
                                  ? value.workTimeTotelInHour(list.workTime)
                                  : 'no data'),
                        ),
                        Expanded(
                          child: cardCheakinOut(
                              name: 'Total',
                              date: list.totalTime != null
                                  ? value.workTimeTotelInHour(list.totalTime)
                                  : 'no data'),
                        ),
                      ],
                    ),
                    Gap(20),
                    textStyled(
                      text: 'Attendance Details',
                      fontweight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    Gap(10),
                    Expanded(
                      child: GridView.builder(
                        itemCount: 5,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 3.6,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: colorForAttentends[
                                    index % colorForAttentends.length],
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: textStyled(
                                text: textForAttends[
                                    index % textForAttends.length],
                                fontweight: FontWeight.w900,
                                color: colorForAttentends[
                                    index % colorForAttentends.length],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
