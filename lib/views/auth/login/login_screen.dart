import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/utils/image/image.dart';
import 'package:slms/view_model/auth/auth_controller.dart';
import 'package:slms/views/auth/forget/forget_password.dart';
import 'package:slms/views/auth/widget/login_widget.dart';
import 'package:slms/views/bottom/bottom_navigation.dart';
import 'package:slms/views/home/home_screen.dart';
import 'package:slms/views/reviews/reviews.dart';
import 'package:slms/views/reviews/score_details.dart';
import 'package:slms/widget/widget.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginScreen({super.key});

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
                costumTextfeild(hintText: 'Email', controller: emailController),
                costumTextfeild(
                    hintText: 'Password', controller: passwordController),
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
                            text: 'Forget Password',
                            color: ColorConstents.primeryColor))),
                GestureDetector(
                    onTap: () {
                      context
                          .read<AuthenticationController>()
                          .userlogin(
                              email: emailController.text,
                              password: passwordController.text)
                          .then((value) {
                        if (value == 'login success') {
                          Navigator.push(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReviewsPage()));
                        }
                      });
                    },
                    child: containerBtn(
                      context: context,
                      text: 'Login',
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
