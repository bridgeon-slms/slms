import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/view_model/ReviewController/reviewcontroller.dart';
import 'package:slms/view_model/attendence/attendencecontroller.dart';
import 'package:slms/view_model/course/course.dart';
import 'package:slms/view_model/profilecontroller/profilecontroller.dart';
import 'package:slms/view_model/auth/auth_controller.dart';
import 'package:slms/view_model/bottom_bar.dart';
import 'package:slms/view_model/datecontroller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slms/view_model/home/home_controller.dart';
import 'package:slms/views/splash/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CourseController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => Reviewcontroller(),
        ),
        ChangeNotifierProvider(create: (context) => AuthenticationController()),
        ChangeNotifierProvider(
          create: (context) => DateProvider(),
        ),
        ChangeNotifierProvider(create: (context) => Profilecontroller()),
        ChangeNotifierProvider(
          create: (context) => Attendencecontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomBarController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DateProvider(),
        )
      ],
      child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            primaryColor: Color(0xff156EF6)),
      ),
    );
  }
}
