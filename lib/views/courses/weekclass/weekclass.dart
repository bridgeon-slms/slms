import 'package:flutter/material.dart';

class Weekclasspage extends StatefulWidget {
  const Weekclasspage({super.key});

  @override
  State<Weekclasspage> createState() => _WeekclasspageState();
}

class _WeekclasspageState extends State<Weekclasspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                elevation: 3,
                child: Container(
                  height: 500,
                  width: 400,
                  color: const Color.fromARGB(255, 237, 237, 237),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'what is Dart ?',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 50),
                      Text('Video Class'),
                      SizedBox(height: 50),
                      Text('Notes')
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
