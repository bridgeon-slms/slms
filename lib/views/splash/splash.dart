import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/utils/image/image.dart';
import 'package:slms/views/auth/login/login_screen.dart';
import 'package:slms/views/bottom/bottom_navigation.dart';
import 'package:slms/widget/widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
    checkLogin();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstents.bagroundColor,
      body: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImageConstents.bridgeonLogo,
                width: 100,
              ),
              SizedBox(
                height: 10,
              ),
              textStyled(
                  text: 'Bridgeon', fontweight: FontWeight.bold, fontSize: 30)
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    if(token !=null){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomBar()));
    }else{
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    }
  }
}
