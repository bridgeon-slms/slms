import 'package:flutter/material.dart';
import 'package:slms/views/courses/weekclass/weekclass.dart';

class Weektopicspage extends StatefulWidget {
  const Weektopicspage({super.key});

  @override
  State<Weektopicspage> createState() => _WeektopicspageState();
}

class _WeektopicspageState extends State<Weektopicspage> {
  List<String> topics = [
    "What is Dart?",
    "Dart Keywords",
    "Dart Datatypes",
    "Variables",
    "Dart Constants"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: topics.map((topic) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Weekclasspage()));
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: ListTile(
                      title: Text(
                        topic,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
