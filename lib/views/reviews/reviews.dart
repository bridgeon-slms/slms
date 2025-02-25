import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/view_model/ReviewController/reviewcontroller.dart';
import 'package:slms/views/reviews/samplebar.dart';
import 'package:slms/views/reviews/score_details.dart';
import 'package:slms/widget/widget.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<Reviewcontroller>(context, listen: false)
        .getAllDataFromReview();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Review Report',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<Reviewcontroller>(builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(children: [
                      Expanded(
                        child: currntCard(
                          context: context,
                          title: "Current Week",
                          content: value.reviewList.isEmpty
                              ? 'Loading....'
                              : "${value.reviewList.first.studentId?.week}",
                          icon: Icons.person,
                          backgroundColor: Colors.blue.withAlpha(80),
                          iconColor: Colors.blue,
                        ),
                      ),
                      Gap(10),
                      Expanded(
                        child: currntCard(
                          context: context,
                          title: "Next Review",
                          content: "Jan 25, 2025",
                          icon: Icons.calendar_today,
                          backgroundColor: Colors.green.withAlpha(80),
                          iconColor: Colors.green,
                        ),
                      ),
                    ]),
                    Gap(20),
                    fullScoreCard(
                        context: context,
                        totel: value.markTotel.toInt().toDouble(),
                        text1:
                            'You Scored ${value.totelScoreCheacker()[0].toInt()} out of ${value.reviewList.length * 40}',
                        text2: 'You Acquired of Total Score'),
                    fullScoreCard(
                        context: context,
                        totel: 0,
                        text1:
                            'Highest score scored in a Review: ${value.totelScoreCheacker()[1].toInt()}',
                        text2: 'You Acquired of Total Score')
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Performance Overview',
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 300,
                child: Samplebar(),
              ),
              const SizedBox(height: 70),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: ColorConstents.primeryColor)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScoreDetailsPage()),
          );
        },
        backgroundColor: ColorConstents.bagroundColor,
        label: const Text('View Details'),
        icon: const Icon(Icons.arrow_forward),
      ),
    );
  }

  Widget currntCard({
    required BuildContext context,
    required String title,
    required String content,
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget progressCircle(BuildContext context, double totel) {
  final totalScore = context.read<Reviewcontroller>().reviewList.length * 40;
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Column(
      children: [
        CircularPercentIndicator(
          radius: 30.0,
          lineWidth: 5.0,
          percent: min(1.0, totel / totalScore),
          center: Text(
            "${(((totel / totalScore) * 100)).toInt()}%",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          progressColor: Colors.green,
          backgroundColor: Colors.grey[300]!,
          circularStrokeCap: CircularStrokeCap.round,
        ),
      ],
    ),
  );
}
Widget fullScoreCard(
    {required String text1,
    required String text2,
    required double totel,
    required BuildContext context}) {
  return Card(
    elevation: 2,
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SizedBox(
          height: 80,
          width: double.infinity,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textStyled(
                      text: text1, fontSize: 15, fontweight: FontWeight.bold),
                  Gap(5),
                  textStyled(text: text2, fontSize: 12),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    progressCircle(context, totel),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
