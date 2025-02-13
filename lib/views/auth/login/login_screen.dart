import 'package:flutter/material.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/utils/image/image.dart';
import 'package:slms/views/auth/forget/forget_password.dart';
import 'package:slms/views/auth/widget/login_widget.dart';
import 'package:slms/views/bottom/bottom_navigation.dart';
import 'package:slms/widget/widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: ColorConstents.bagroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    Image.asset(
                      ImageConstents.bridgeonLogo,
                      width: 50,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          "Bridgeon",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "code you future",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                costumTextfeild(hintText: 'Email'),
                costumTextfeild(hintText: 'Password'),
                Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgetPasswordPage()));
                        },
                        child: textStyled(
                            text: 'Forget Password', color: ColorConstents.primeryColor))),
                GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomBar()));
    },
                  child: containerBtn(text: 'Login')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
