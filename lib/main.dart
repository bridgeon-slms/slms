import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/AttendendsServices/attendencecontroller.dart';
import 'package:slms/controller/profilecontroller/profilecontroller.dart';
import 'package:slms/services/profileservices/profileservices.dart';
import 'package:slms/view_model/auth/auth_controller.dart';
import 'package:slms/view_model/bottom_bar.dart';
import 'package:slms/view_model/datecontroller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slms/view_model/home/leaderboard_controller.dart';
import 'package:slms/views/%20AttendancePage/%20AttendanceMain/%20attendance.dart';
import 'package:slms/views/ProfilePage/profilepage.dart';
import 'package:slms/views/auth/login/login_screen.dart';
import 'package:slms/views/bottom/bottom_navigation.dart';
import 'package:slms/views/courses/coursess/courses.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ProfileServices().getAllProfileDatas();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LeaderboardController(),
        ),
        ChangeNotifierProvider(create: (context) => AuthenticationController()),
        ChangeNotifierProvider(
          create: (context) => BottomBarController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DateProvider(),
        ),
        ChangeNotifierProvider(create: (context) => Profilecontroller()),
        ChangeNotifierProvider(
          create: (context) => Attendencecontroller(),
        ),
      ],
      child: MaterialApp(
        home: CoursesPage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            primaryColor: Color(0xff156EF6)),
      ),
    );
  }
}
