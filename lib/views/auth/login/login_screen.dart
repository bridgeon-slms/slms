import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/utils/common/scaffoldmessenger.dart';
import 'package:slms/utils/image/image.dart';
import 'package:slms/view_model/auth/auth_controller.dart';
import 'package:slms/views/auth/forget/forget_password.dart';
import 'package:slms/views/auth/widget/login_widget.dart';
import 'package:slms/views/bottom/bottom_navigation.dart';
import 'package:slms/views/widget/widget.dart';


// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
            child: Form(
              key: _formKey,
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
                  costumTextfeild(
                    type: TextInputType.emailAddress,
                      hintText: 'Email',
                      controller: emailController,
                      validationText: 'enter your email'),
                  costumTextfeild(
                      type: TextInputType.visiblePassword,  
                      hintText: 'Password',
                      controller: passwordController,
                      validationText: 'enter your password'),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                ForgetPasswordPage()));
                          },
                          child: textStyled(
                              text: 'Forget Password',
                              color: ColorConstents.primeryColor))),
                  GestureDetector(
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
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
                                      builder: (context) => BottomBar()));
                            } else {
                              scaffoldmessenger(
                                  // ignore: use_build_context_synchronously
                                  context, value ?? "", Colors.grey);
                            }
                          });

                        }
                      },
                      child: containerBtn(
                        context: context,
                        text: 'Login',
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
