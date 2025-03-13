import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/view_model/course/course.dart';
import 'package:slms/views/courses/weektopics/weektopics.dart';

class Weeksubpage extends StatefulWidget {
  final String courseId;
  final String catogaryId;
  const Weeksubpage(
      {super.key, required this.catogaryId, required this.courseId});

  @override
  State<Weeksubpage> createState() => _WeeksubpageState();
}

class _WeeksubpageState extends State<Weeksubpage> {
  @override
  void initState() {
    super.initState();
    context.read<CourseController>().getSubCatogary(
        categoryId: widget.catogaryId, courseID: widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Consumer<CourseController>(
                builder: (context, value, child) => ListView.builder(
                  itemCount: value.subcategories.length,
                  itemBuilder: (context, index) {
                    final course = value.subcategories[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Weektopicspage(
                            catogaryId: course.courseId,
                            courseIDl: widget.courseId,
                          ),
                        ),
                      ),
                      child: CourseCard(
                        title: course.title,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;

  const CourseCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 237, 237, 237),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Text(title,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseDetailPage extends StatelessWidget {
  final Map<String, dynamic> course;

  const CourseDetailPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course["title"])),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              course["title"],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
