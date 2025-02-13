import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/view_model/bottom_bar.dart';
import 'package:slms/view_model/datecontroller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slms/views/home/home_screen.dart';
import 'package:slms/views/ProfilePage/profilepage.dart';
import 'package:slms/views/auth/login/login_screen.dart';
import 'package:slms/views/home/home_screen.dart';
import 'package:slms/views/bottom/bottom_navigation.dart';
import 'package:slms/views/ProfilePage/profilepage.dart';
import 'package:slms/views/auth/login/login_screen.dart';
import 'package:slms/views/ProfilePage/profilepage.dart';
import 'package:slms/views/bottom/bottom_navigation.dart';
import 'package:slms/views/reviews/reviews.dart';

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
          create: (context) => BottomBarController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DateProvider(),
        )
      ],
      child: MaterialApp(


        home:HomeScreen(),
        

        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            primaryColor: Color(0xff156EF6)),
      ),
    );
  }
}
