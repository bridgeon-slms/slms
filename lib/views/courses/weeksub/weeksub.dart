import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/view_model/course/course.dart';

class WeekSubPage extends StatefulWidget {
  final String topic;
  final String courseId;
  final String name;
  final String categoryId;
  final int categoryNumber;

  const WeekSubPage({
    super.key,
    required this.categoryId,
    required this.courseId,
    required this.name,
    required this.topic,
    required this.categoryNumber,
    required String catogaryId,
  });

  @override
  State<WeekSubPage> createState() => _WeekSubPageState();
}

class _WeekSubPageState extends State<WeekSubPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final courseController = context.read<CourseController>();
      courseController.fullAllcourse();
      courseController.getAllCourse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CourseController>(
        builder: (context, courseController, child) {
          return ListView.builder(
            itemCount: courseController.fullcourse.length,
            itemBuilder: (context, index) {
              final course = courseController.fullcourse[index];
              return ListTile(
                title: Text(course.name.toString()),
                subtitle: Text(course.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
