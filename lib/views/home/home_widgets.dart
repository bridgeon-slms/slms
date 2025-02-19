

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:slms/model/dashboard.dart';
import 'package:slms/widget/widget.dart';

CircularPercentIndicator circulePercentange() {
  return CircularPercentIndicator(
    animation: true,
    animationDuration: 1000,
    radius: 40.0,
    lineWidth: 10.0,
    percent: 0.43,
    center: textStyled(text: '83%'),
    progressColor: Colors.blue,
    backgroundColor: Colors.grey.shade300,
    circularStrokeCap: CircularStrokeCap.round,
  );
}

class attendaceContainer extends StatelessWidget {
  // IconData icon;
  // String percetange;
  // String text;

  attendaceContainer({
    // required this.percetange,
    // required this.text,
    // required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey.shade400,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textStyled(
                    text: 'Attendance',
                    fontweight: FontWeight.bold,
                    fontSize: 15),
                textStyled(text: '85%')
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget leaderBoardWidget(BuildContext context, List<LeaderboardData> data) {
  if (data.isEmpty) {
    return Center(
      child: Text('no data available'),
    );
  }
  return Container(
    width: double.infinity,
    height: 250,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0XFFD1B0EE),
          Color(0xFF7024DB),
        ],
      ),
    ),
    child: Stack(
      children: [
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: Color(0XFF111946),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Color(0XFF343C6A),
              ),
              width: MediaQuery.of(context).size.width / 3.3,
              height: 180,
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 15,
          top: 75,
          child: SizedBox(
            width: 70,
            height: 70,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  data[1].studentId?.image ?? '',
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Positioned(
          top: 75,
          right: MediaQuery.of(context).size.width / 15,
          child: SizedBox(
            height: 70,
            width: 70,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  data[2].studentId?.image ?? '',
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2.55,
          top: 30,
          child: SizedBox(
            height: 70,
            width: 70,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  data[0].studentId?.image ?? '',
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Positioned(
            top: 130,
            child: textStyled(
                text: data[0].totalScore.toString(), color: Color(0XFFFFD701)))
      ],
    ),
  );
}
