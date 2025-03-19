import 'package:flutter/material.dart';
import 'package:slms/services/auth/auth_services.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/utils/common/scaffoldmessenger.dart';
import 'package:slms/utils/image/image.dart';
import 'package:slms/views/auth/widget/login_widget.dart';
import 'package:slms/views/bottom/bottom_navigation.dart';

// ignore: must_be_immutable
class ChangePasswordScreen extends StatelessWidget {
  final String email;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrimPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ChangePasswordScreen({super.key, required this.email});

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
                      controller: passwordController,
                      hintText: 'new password',
                      validationText: 'enter password'),
                  costumTextfeild(
                      controller: confrimPasswordController,
                      hintText: 'confirm password',
                      validationText: 'enter password'),
                  GestureDetector(
                      onTap: () {
                        _formKey.currentState?.validate();
                        if (passwordController.text ==
                            confrimPasswordController.text) {
                          AuthServices().confirmPAssword(
                              email, passwordController.text.trim()).then((value){
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomBar()));
                              });

                        } else {
                          scaffoldmessenger(
                              context, 'Passwords must match', Colors.grey);
                        }
                      },
                      child: containerBtn(
                        context: context,
                        text: 'confirm',
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
