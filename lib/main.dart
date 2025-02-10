import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slms/views/login/login_screen.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: LoginScreen(),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
        ),
        primaryColor: Color(0xff156EF6)),
    );
  }
}
