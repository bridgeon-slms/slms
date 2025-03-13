import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
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
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 10),
                Text("Course",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
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
            itemBuilder: (context, index) {
              final course = courses[index];
              return CourseCard(
                title: course["title"],
                color: course["color"],
                imagePath: course["image"],
              );
            },
          ),
        ),
      ),
    ]));
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final Color color;
  final String imagePath;

  const CourseCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            Image.asset(imagePath, width: 120, fit: BoxFit.contain),
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> courses = [
  {
    "title": "HTML",
    "color": Colors.white,
    "image": "assets/image/html_imaggee-removebg-preview.png"
  },
  {
    "title": "CSS",
    "color": Colors.white,
    "image": "assets/image/css_imagee-removebg-preview.png"
  },
  {
    "title": "JavaScript",
    "color": Colors.white,
    "image": "assets/image/js_imageee-removebg-preview.png"
  },
  {
    "title": "React",
    "color": Colors.white,
    "image": "assets/image/react_imagee-removebg-preview.png"
  },
  {
    "title": "MERN",
    "color": Colors.white,
    "image": "assets/image/MERN_Stack_App_Development-removebg-preview.png",
  },
  {
    "title": "Flutter",
    "color": Colors.white,
    "image": "assets/image/flutterimg-removebg-preview.png"
  },
  {
    "title": ".Net",
    "color": Colors.white,
    "image": "assets/image/net-removebg-preview.png"
  },
  {
    "title": "Python",
    "color": Colors.white,
    "image":
        "assets/image/Common_excuses_for_not_having_a_website-removebg-preview.png"
  },
];
