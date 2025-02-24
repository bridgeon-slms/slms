import 'package:flutter/material.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/utils/image/image.dart';
import 'package:slms/views/auth/widget/login_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ChangePasswordScreen({super.key});

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
                      hintText: 'new password',
                      validationText: 'enter password'),
                  costumTextfeild(
                      hintText: 'confirm password',
                      validationText: 'enter password'),
                  GestureDetector(
                      onTap: () {
                        _formKey.currentState?.validate();
                        // context
                        //     .read<AuthenticationController>()
                        //     .userlogin(
                        //         email: emailController.text,
                        //         password: passwordController.text)
                        //     .then((value) {
                        //   if (value == 'login success') {
                        //     Navigator.push(
                        //         // ignore: use_build_context_synchronously
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => BottomBar()));
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
