import 'package:flutter/material.dart';
import 'package:slms/services/review.dart';
import 'package:slms/views/courses/weeksub/weeksub.dart';

class WeeklistPage extends StatefulWidget {
  const WeeklistPage({super.key});

  @override
  State<WeeklistPage> createState() => _WeeklistPageState();
}

class _WeeklistPageState extends State<WeeklistPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReviewServices().getReviewCatogary();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
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
                 Row(
                  children: [
                    IconButton(icon: Icon( Icons.arrow_back, color: Colors.white),onPressed: (){
                      Navigator.pop(context);
                    },),
                    SizedBox(width: 10),
                    Text("Course",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Flutter",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Choose your Week",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
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
                        builder: (context) => Weeksubpage(),
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
    "courses": "1 Week",
    "color": Colors.white,
  },
  {
    "title": "Dart Advance",
    "courses": "2 Week",
    "color": Colors.white,
  },
  {
    "title": "Flutter Basics",
    "courses": "2 Weeks",
    "color": Colors.white,
  },
  {
    "title": "Flutter",
    "courses": "7 Weeks",
    "color": Colors.white,
  },
  {
    "title": "Local Database",
    "courses": "20 Courses",
    "color": Colors.white,
  },
  {
    "title": "First Badge",
    "courses": "20 Courses",
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
