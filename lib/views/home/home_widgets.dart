  import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:slms/widget/widget.dart';

CircularPercentIndicator circulePercentange() {
    return CircularPercentIndicator(
      animation: true,
      animationDuration: 1000,
                    radius: 40.0,
                    lineWidth: 10.0,
                    percent: 0.83,
                    center: textStyled(text: '83%'),
                    progressColor: Colors.blue,
                    backgroundColor: Colors.grey.shade300,
                    circularStrokeCap: CircularStrokeCap.round,
                  );
  }
  class attendaceContainer extends StatelessWidget {
  const attendaceContainer({
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
              backgroundColor:Colors.blue,
             child:   Icon(Icons.person,color: Colors.white,)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textStyled(text: 'Attendance',fontweight: FontWeight.bold,fontSize: 15),
                textStyled(text: '85%')
              ],
            )
          ],
        ),
      ),
    );
  }
}