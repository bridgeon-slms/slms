import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/view_model/course/course.dart';
import 'package:slms/views/courses/WeekList/weeklist.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CourseController>().getAllCourse();
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
                const Row(
                  children: [
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
              child: Consumer<CourseController>(
                builder:(context, value, child) =>  GridView.builder(
                  itemCount: value.allCourse.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    final course = value.allCourse[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WeeklistPage(id: course.id,))),
                      child: CourseCard(
                        title:course.name ,
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
  // final Color color;

  const CourseCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          // color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(imagePath, height: 70, width: 70, fit: BoxFit.contain),
            // const SizedBox(height: 10),
            Text(title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(height: 5),
            // Text(courses,
            //     style: const TextStyle(fontSize: 14, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
