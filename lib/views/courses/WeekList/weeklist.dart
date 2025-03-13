import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/view_model/course/course.dart';
import 'package:slms/views/courses/weeksub/weeksub.dart';

class WeeklistPage extends StatelessWidget {
  final String id;
  const WeeklistPage({super.key,required this.id});

  @override

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
                const SizedBox(height: 20),
                const Text(
                  "Flutter week",
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
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FutureBuilder(
                future: context.read<CourseController>().getWeekData(courseId: id),
                builder: (context, snapshot) {
                  return
                  ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    final course = snapshot.data?[index];
                    return ListTile(
                       onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Weeksubpage(catogaryId: course?.id??'',courseId: course?.courseId??'',),
                        ),
                      ),
                      title: Container(
                        height: 100,
                        width: 200,
                        color: const Color.fromARGB(255, 244, 244, 245),
                        child: Center(child: Text(course?.id??''))),
                    );
                  },
                );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}

