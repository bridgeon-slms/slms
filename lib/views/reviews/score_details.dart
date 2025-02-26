import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:score_progress_pretty_display/score_progress_pretty_display.dart';
import 'package:slms/model/ReviewModel/review.dart';
import 'package:slms/view_model/ReviewController/reviewcontroller.dart';
import 'package:slms/views/reviews/widgets.dart';
import 'package:slms/widget/widget.dart';

class ScoreDetailsPage extends StatefulWidget {
  const ScoreDetailsPage({super.key});

  @override
  State<ScoreDetailsPage> createState() => _ScoreDetailsPageState();
}

class _ScoreDetailsPageState extends State<ScoreDetailsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Reviewcontroller>(context, listen: false)
        .getAllDataFromReview();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Score Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          summaryCard(),
          Consumer<Reviewcontroller>(
            builder: (context, value, child) => Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: value.reviewList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: weekCard(data: value.reviewList[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget summaryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.lightBlueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Current Score',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '85/100',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.85,
              backgroundColor: Colors.white.withOpacity(0.3),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              minHeight: 10,
            ),
          ),
        ],
      ),
    );
  }
}

void showStudentDetails(BuildContext context, ReviewData data, review, task,
    attendance, discipline) {
  double calculateReviewScore(
      double review, double task, double attendance, double discipline) {
    double weightedAverage =
        (((review + task) * 0.7 + (attendance + discipline) * 0.3) / 20) * 100;
    return double.parse(weightedAverage.toStringAsFixed(2)).toDouble();
  }

  Color getScoreColor(double score) {
    if (score > 80) {
      return Colors.green;
    } else if (score > 70) {
      return Colors.yellow;
    } else if (score > 60) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  String getScoreText(double score) {
    if (score > 80) {
      return 'Good';
    } else if (score > 70) {
      return 'Average';
    } else if (score > 60) {
      return 'Below Average';
    } else {
      return 'WeekBack';
    }
  }

  double reviewScore = (double.tryParse(review.toString()) ?? 0.0) + 0.1;
  double taskScore = (double.tryParse(task.toString()) ?? 0.0) + 0.1;
  double attendanceScore =
      (double.tryParse(attendance.toString()) ?? 0.0).toDouble();
  double disciplineScore =
      (double.tryParse(discipline.toString()) ?? 0.0).toDouble() + 0.1;
  var datasss = calculateReviewScore(
          reviewScore, taskScore, attendanceScore, disciplineScore) -
      0.5;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: getScoreColor(datasss)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(data.studentId?.image ??
                          'https://cdn.pixabay.com/photo/2013/07/13/10/44/man-157699_640.png'),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.studentId?.name ?? 'no name',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('Week' + ' ' + data.week.toString(),
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                    Spacer(),
                    Consumer<Reviewcontroller>(
                      builder: (context, value, child) => Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          textStyled(
                              text: getScoreText(datasss),
                              color: getScoreColor(datasss),
                              fontSize: 15,
                              fontweight: FontWeight.normal),
                          value.textTrue
                              ? TextButton(
                                  onPressed: () {
                                    value.textVisible();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: textStyled(
                                        text: data.remark ?? 'no remark added',
                                        color: Colors.black),
                                  ))
                              : IconButton(
                                  onPressed: () {
                                    value.textVisible();
                                  },
                                  icon: Icon(
                                    Icons.draw,
                                    color: getScoreColor(datasss),
                                  ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Gap(10),
              SizedBox(height: 16),
              sectionTitle("Academic Performance", Icons.school),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  progressCircle(
                      "Review", 0, Colors.blue, data.academic?.review),
                  Gap(15),
                  progressCircle("Task", 0, Colors.green, data.academic?.task),
                ],
              ),
              const SizedBox(height: 16),
              sectionTitle("Other Aspects", Icons.star),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  progressCircle(
                      "Attendance", 0, Colors.orange, data.others?.attendance),
                  Gap(15),
                  progressCircle(
                      "Discipline", 0, Colors.red, data.others?.attendance),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryArcAnimationComponent(
                    score: datasss - 0.5,
                    maxScore: 100,
                    arcHeight: 200,
                    arcWidth: 200,
                    backgroundArcStrokeThickness: 15,
                    progressArcStrokeThickness: 15,
                    enableStepperEffect: false,
                    isRoundEdges: true,
                    minScoreTextFontSize: 15,
                    maxScoreTextFontSize: 15,
                    isRoundOffScoreWhileProgress: true,
                    isRoundOffScore: true,
                    showOutOfScoreFormat: true,
                    isPrgressCurveFilled: false,
                    scoreAnimationDuration: Duration(seconds: 2),
                    scoreTextAnimationDuration: Duration(milliseconds: 500),
                    scoreTextStyle:
                        TextStyle(fontWeight: FontWeight.normal, height: 1),
                    arcBackgroundColor: Colors.black12,
                    arcProgressGradientColors: [
                      getScoreColor(datasss),
                      getScoreColor(datasss)
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );
    },
  );
}

Widget sectionTitle(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}

Widget progressCircle(String title, double value, Color color, bardata) {
  var data = bardata * 10;
  Color getScoreColor(double score) {
    if (score > 80) {
      return Colors.green;
    } else if (score > 70) {
      return Colors.yellow;
    } else if (score > 60) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Column(
      children: [
        CircularPercentIndicator(
          radius: 30.0,
          lineWidth: 5.0,
          percent: bardata / 10,
          center: Text(
            "${(data).toInt()}%",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          progressColor: color,
          backgroundColor: Colors.grey[300]!,
          circularStrokeCap: CircularStrokeCap.round,
        ),
        const SizedBox(width: 16),
        Gap(5),
        Text(title, style: TextStyle(fontSize: 16)),
      ],
    ),
  );
}
