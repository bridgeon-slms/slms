import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:slms/helpers/helpers.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/view_model/ReviewController/reviewcontroller.dart';
import 'package:slms/views/error/error.dart';
import 'package:slms/views/reviews/samplebar.dart';
import 'package:slms/views/reviews/score_details.dart';
import 'package:slms/views/reviews/widgets.dart';
import 'package:slms/views/widget/widget.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final reviewController = context.read<Reviewcontroller>();
      reviewController.getAllDataFromReview();
      reviewController.getReviewDatw();
    });
  }

  @override
  Widget build(BuildContext context) {

    return context.watch<Reviewcontroller>().isLoding
        ?  Scaffold(
          backgroundColor: Colors.white,
          body: loddingWidget())
        : context.watch<Reviewcontroller>().isError
            ? Errorpage(
                onRefresh: context.read<Reviewcontroller>().getAllDataFromReview,
              )
            : Scaffold(
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
                  child: Consumer<Reviewcontroller>(
                    builder: (context, value, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  // ignore: deprecated_member_use
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: currntCard(
                                        context: context,
                                        title: "Current Week",
                                        content: value.reviewList.isNotEmpty &&
                                                value.reviewList.first.studentId != null
                                            ? "${value.reviewList.first.studentId!.week}"
                                            : 'Loading...',
                                        icon: Icons.person,
                                        backgroundColor: Colors.blue.withAlpha(80),
                                        iconColor: Colors.blue,
                                      ),
                                    ),
                                    const Gap(10),
                                    Expanded(
                                      child: currntCard(
                                        context: context,
                                        title: "Next Review",
                                        content: value.reviewDate != null
                                            ? formatDate(DateTime.parse(value.reviewDate!))
                                            : 'Loading...',
                                        icon: Icons.calendar_today,
                                        backgroundColor: Colors.green.withAlpha(80),
                                        iconColor: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(20),
                                fullScoreCard(
                                  totalScore: value.reviewList.length * 40,
                                  context: context,
                                  total: value.totelScoreCheacker()[0].toDouble(),
                                  text1:
                                      'You Scored ${value.totelScoreCheacker()[0].toInt()} out of ${value.reviewList.length * 40}',
                                  text2: 'You Acquired of Total Score',
                                ),
                                fullScoreCard(
                                  totalScore: 40,
                                  context: context,
                                  total: value.totelScoreCheacker()[1].toDouble(),
                                  text1:
                                      'Highest score in a Review: ${value.totelScoreCheacker()[1].toInt()}',
                                  text2: 'You Acquired of Total Score',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text('Performance Overview'),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 300,
                                child: SalesChartPage()
                          ),
                          const SizedBox(height: 100),
                        ],
                      );
                    },
                  ),
                ),
                floatingActionButton: FloatingActionButton.extended(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScoreDetailsPage()),
                    );
                  },
                  backgroundColor: ColorConstents.bagroundColor,
                  label: const Text(
                    'View Details',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConstents.primeryColor,
                    ),
                  ),
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: ColorConstents.primeryColor,
                  ),
                ),
              );
  }
}