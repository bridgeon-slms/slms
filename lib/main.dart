import 'package:flutter/material.dart';
import 'package:slms/view/%20AttendancePage/%20AttendanceMain/%20attendance.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xff156EF6)),
      home: AttendancePage(),
    );
  }
}
