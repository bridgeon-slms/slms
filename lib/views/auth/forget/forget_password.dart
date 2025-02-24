import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/utils/common/scaffoldmessenger.dart';
import 'package:slms/utils/image/image.dart';
import 'package:slms/view_model/auth/auth_controller.dart';
import 'package:slms/views/auth/otp/opt_screen.dart';
import 'package:slms/views/auth/widget/login_widget.dart';

class ForgetPasswordPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthenticationController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: ColorConstents.bagroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 20,
              children: [
                SizedBox(
                  height: 70,
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
                  validationText: 'Enter Your Email',
                  type: TextInputType.emailAddress,
                  controller: emailController,
                  hintText: 'Email',
                ),
                GestureDetector(
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context
                            .read<AuthenticationController>()
                            .emailVerify(email: emailController.text)
                            .then((value) {
                          // ignore: use_build_context_synchronously
                          scaffoldmessenger(context, value ?? '', Colors.grey);
                          if (value == 'Successfully generated a otp') {
                            Navigator.push(
                                // ignore: use_build_context_synchronously
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OptScreen(
                                          email: emailController.text,
                                        )));
                          }
                        });
                      }
                    },
                    child: containerBtn(text: 'Send OTP', context: context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
