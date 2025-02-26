import 'package:flutter/material.dart';
import 'package:slms/views/courses/weektopics/weektopics.dart';

class Weeksubpage extends StatefulWidget {
  const Weeksubpage({super.key});

  @override
  State<Weeksubpage> createState() => _WeeksubpageState();
}

class _WeeksubpageState extends State<Weeksubpage> {
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
              child: GridView.builder(
                itemCount: courses.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 4,
                ),
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Weektopicspage(),
                      ),
                    ),
                    child: CourseCard(
                      title: course["title"],
                      courses: course["courses"],
                      color: course["color"],
                    ),
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

List<Map<String, dynamic>> courses = [
  {
    "title": "Dart Basic",
    "courses": "day 1",
    "color": Colors.white,
  },
  {
    "title": "Dart Basics",
    "courses": "day 2",
    "color": Colors.white,
  },
  {
    "title": "methods",
    "courses": "day 3",
    "color": Colors.white,
  },
  {
    "title": "function",
    "courses": "day 4",
    "color": Colors.white,
  },
  {
    "title": "practice",
    "courses": "day 5",
    "color": Colors.white,
  },
  {
    "title": "review",
    "courses": "day 5",
    "color": Colors.white,
  },
  {
    "title": "task",
    "courses": "day 7",
    "color": Colors.white,
  },
];

class CourseCard extends StatelessWidget {
  final String title, courses;

  final Color color;

  const CourseCard({
    super.key,
    required this.title,
    required this.courses,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Text(title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(height: 5),
            Text(courses,
                style: const TextStyle(fontSize: 14, color: Colors.black)),
          ],
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
            Text(
              course["courses"],
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
