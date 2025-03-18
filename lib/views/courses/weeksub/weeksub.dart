import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/view_model/course/course.dart';

class Weeksubpage extends StatefulWidget {
  final String courseId;
  final String catogaryId;
  const Weeksubpage({
    super.key,
    required this.catogaryId,
    required this.courseId,
  });

  @override
  State<Weeksubpage> createState() => _WeeksubpageState();
}

class _WeeksubpageState extends State<Weeksubpage> {
  @override
  void initState() {
    super.initState();
    context.read<CourseController>().getSubCatogary(
          categoryId: widget.catogaryId,
          courseID: widget.courseId,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Subcategories'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Consumer<CourseController>(
                builder: (context, value, child) {
                  if (value.subcategories.isEmpty) {
                    return const Center(
                        child: Text('No subcategories available'));
                  }
                  return ListView.builder(
                    itemCount: value.subcategories.length,
                    itemBuilder: (context, index) {
                      final course = value.subcategories[index];
                      return ExpansionTile(
                        key: Key(course.id),
                        title: Text(course.title),
                        onExpansionChanged: (isExpanded) {
                          if (isExpanded) {
                   
                              
                            context.read<CourseController>().getTopics(
                                  categoryId: course.id,
                                  courseID: widget.courseId,
                                );
                          } else {}
                        },
                        children: value.topicData.isNotEmpty
                            ? value.topicData
                                .map((topic) => ListTile(
                                      title: Text(topic.title),
                                    ))
                                .toList()
                            : [
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text('No topics available'),
                                ),
                              ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
