import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/widget/widget.dart';

Widget attenceBar({required BuildContext context}) {
  return Container(
    width: double.infinity,
    child: Column(
      children: [
        Card(
          elevation: 2,
          color: ColorConstents.bagroundColor,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              spacing: 15,
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
                cd(context: context),
                cd(context: context),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

GestureDetector cd({required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      showMaterialModalBottomSheet(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textStyled(
                    text: 'Attendance Report',
                    fontweight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  Gap(20),
                  cardCheakinOut(name: 'CheckIn', date: '08:45 AM'),
                  Gap(10),
                  cardCheakinOut(name: 'CheckOut', date: '05:00 PM'),
                  Gap(10),
                  Row(
                    children: [
                      Expanded(
                        child: cardCheakinOut(name: 'Work Time', date: '6H 5M'),
                      ),
                      Expanded(
                        child: cardCheakinOut(name: 'Total', date: '6H 12M'),
                      ),
                    ],
                  ),
                  Gap(20),
                  textStyled(
                    text: 'Attendance Details',
                    fontweight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 3.5,
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
                                width: 3),
                          ),
                          child: Center(
                            child: textStyled(
                              text:
                                  textForAttends[index % textForAttends.length],
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
          );
        },
      );
    },
    child: Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            textStyled(text: '08 Feb 2025'),
            Spacer(),
            Expanded(child: Divider()),
            Spacer(),
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.red,
                  )),
              child:
                  Center(child: textStyled(text: 'Excused', color: Colors.red)),
            )
          ],
        ),
      ),
    ),
  );
}

Card cardCheakinOut({required String name, required String date}) {
  return Card(
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          textStyled(text: name),
          textStyled(text: '-'),
          textStyled(text: date)
        ],
      ),
    ),
  );
}

List colorForAttentends = [
  const Color.fromARGB(255, 94, 207, 98),
  const Color.fromARGB(255, 241, 74, 63)
];
List textForAttends = ['In 8-42 Am', 'Out 9-50 Am'];
