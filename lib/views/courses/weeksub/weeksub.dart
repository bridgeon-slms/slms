import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/view_model/course/course.dart';
import 'package:slms/views/courses/topic_screen.dart';
import 'package:slms/views/courses/weektopics/weektopics.dart';

class Weeksubpage extends StatefulWidget {
  final String courseId;
  final String name;
  final String catogaryId;

  const Weeksubpage({
    super.key,
    required this.catogaryId,
    required this.courseId,
    required this.name,
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
      body: Column(
        children: [
          Container(
            height: 176,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 30, spreadRadius: 3)
              ],
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 29, 77, 161), Colors.blueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.name,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      " Choose your topic",
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Consumer<CourseController>(
              builder: (context, value, child) {
                if (value.subcategories.isEmpty) {
                  return const Center(
                      child: Text('No subcategories available'));
                }
                return ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: value.subcategories.length,
                  itemBuilder: (context, index) {
                    final course = value.subcategories[index];
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 246, 246, 246),
                                child: Text("${index + 1}"),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Card(
                              color: Colors.white,
                              margin: const EdgeInsets.only(bottom: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ExpansionTile(
                                key: Key(course.id),
                                title: Row(
                                  children: [
                                    Text(
                                      course.title,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                onExpansionChanged: (isExpanded) {
                                  if (isExpanded) {
                                    context.read<CourseController>().getTopics(
                                          categoryId: course.id,
                                          courseID: widget.courseId,
                                        );
                                  }
                                },
                                children: value.topicData.isNotEmpty
                                    ? value.topicData.map((topic) {
                                        return ListTile(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TopicScreen(
                                                          topic: topic.title))),
                                          leading: const Icon(
                                              Icons.play_circle_outline,
                                              color: Colors.blue),
                                          title: Text(
                                            topic.title,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        );
                                      }).toList()
                                    : [
                                        const Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Text('No topics available'),
                                        ),
                                      ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
