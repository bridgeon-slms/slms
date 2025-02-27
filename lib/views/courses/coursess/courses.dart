import 'package:flutter/material.dart';
import 'package:slms/views/courses/WeekList/weeklist.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
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
                const Row(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white),
                    SizedBox(width: 10),
                    Text("Courses",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Ready to learn?",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Choose your course",
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
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WeeklistPage())),
                    child: CourseCard(
                      title: course["title"],
                      courses: course["courses"],
                      color: course["color"],
                      imagePath: course["image"],
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
    "title": "HTML",
    "courses": "1 Week",
    "color": Colors.white,
    "image": "assets/image/html_imaggee-removebg-preview.png"
  },
  {
    "title": "CSS",
    "courses": "1 Week",
    "color": Colors.white,
    "image": "assets/image/css_imagee-removebg-preview.png"
  },
  {
    "title": "JavaScript",
    "courses": "2 Weeks",
    "color": Colors.white,
    "image": "assets/image/js_imageee-removebg-preview.png"
  },
  {
    "title": "React",
    "courses": "7 Weeks",
    "color": Colors.white,
    "image": "assets/image/react_imagee-removebg-preview.png"
  },
  {
    "title": "MERN",
    "courses": "20 Courses",
    "color": Colors.white,
    "image": "assets/image/mern_imageee-removebg-preview.png"
  },
  {
    "title": "Flutter",
    "courses": "20 Courses",
    "color": Colors.white,
    "image": "assets/image/flutter_imggg-removebg-preview.png"
  },
  {
    "title": ".Net",
    "courses": "20 Courses",
    "color": Colors.white,
    "image": "assets/image/net_imageee-removebg-preview.png"
  },
  {
    "title": "Python",
    "courses": "20 Courses",
    "color": Colors.white,
    "image": "assets/image/python_imagee-removebg-preview.png"
  },
];

class CourseCard extends StatelessWidget {
  final String title, courses, imagePath;
  final Color color;

  const CourseCard({
    super.key,
    required this.title,
    required this.courses,
    required this.color,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 70, width: 70, fit: BoxFit.contain),
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
