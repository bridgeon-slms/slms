import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/view_model/course/course.dart';
import 'package:slms/views/courses/topic_screen.dart';

class Weektopicspage extends StatefulWidget {
  final String catogaryId;
  final String courseIDl;
  const Weektopicspage({super.key,required this.catogaryId,
  required  this.courseIDl});

  @override
  State<Weektopicspage> createState() => _WeektopicspageState();
}

class _WeektopicspageState extends State<Weektopicspage> {
  @override
  void initState() {
    super.initState();
    context.read<CourseController>().getTopics(categoryId: widget.catogaryId  ,courseID:widget.courseIDl );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<CourseController>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.topicData.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TopicScreen(
                              topic: value.topicData[index].description,
                            ))),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 80,
                      width: 300,
                      color: Color.fromARGB(255, 237, 237, 237),
                      child: Center(child: Text(value.topicData[index].title))),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
