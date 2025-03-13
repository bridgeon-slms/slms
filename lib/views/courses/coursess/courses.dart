import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/view_model/course/course.dart';
import 'package:slms/views/courses/WeekList/weeklist.dart';
import 'package:slms/views/courses/coursess/course_list.dart';
import 'package:slms/views/courses/coursess/course_widgets.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  void initState() {
    super.initState();
    context.read<CourseController>().getAllCourse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 29, 77, 161), Colors.blueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Course",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Choose your Course",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Consumer<CourseController>(
                builder: (context, value, child) {
                  List<Map<String, dynamic>> availableCourses = [];
                  List<Map<String, dynamic>> lockedCourses = [];

                  for (var course in courses) {
                    if (value.allCourse.any((c) => c.name == course["title"])) {
                      availableCourses.add(course);
                    } else {
                      lockedCourses.add(course);
                    }
                  }

                  List<Map<String, dynamic>> finalCourses = [
                    ...availableCourses,
                    ...lockedCourses
                  ];
                  return GridView.builder(
                    itemCount: finalCourses.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      final course = finalCourses[index];
                      final isAvailable = availableCourses.contains(course);

                      return isAvailable
                          ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WeeklistPage(
                                          imagePath: course['image'],
                                         courseModel: value.allCourse[index],)));
                              },
                              child: CourseCard(
                                title: course["title"],
                                color: course["color"],
                                imagePath: course["image"],
                              ),
                            )
                          : LockedCourseCard(
                              title: course["title"],
                              imagePath: course["image"],
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
