import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:slms/views/courses/coursess/course_list.dart';
import 'package:slms/views/courses/weeksub/weeksub.dart';

class TopicScreen extends StatefulWidget {
  final String topic;
  final String courseId;
  final String catogaryId;
  final String name;

  const TopicScreen(
      {super.key,
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
      appBar: AppBar(title: const Text("Topic Details")),
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
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Completed!"),
                    content: const Text("You have finished this topic."),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Weeksubpage(
                                    catogaryId: widget.catogaryId,
                                    courseId: widget.courseId,
                                    name: widget.name))),
                        child: Text("OK"),
                      ),
                    ],
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
