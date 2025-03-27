import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:slms/model/course/cartogary.dart';
import 'package:slms/services/course/course.dart';
import 'package:slms/views/widget/widget.dart';

class TopicScreen extends StatefulWidget {
  final String topic;
  final String courseId;
  final String catogaryId;
  final String name;
  final String topicId;
  final CourseModel courseModel;

  const TopicScreen(
      {super.key,
      required this.courseModel,
      required this.topicId,
      required this.topic,
      required this.courseId,
      required this.catogaryId,
      required this.name});

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: textStyled(
              text: 'Topic', fontSize: 18, fontweight: FontWeight.bold)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              widget.topic,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Gap(500),
            ElevatedButton(
              onPressed: () {
                ReviewServices().finishTopics(widget.courseModel.mainID);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Completed!"),
                    content: const Text("You have finished this topic."),
                    actions: [],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Finish',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
