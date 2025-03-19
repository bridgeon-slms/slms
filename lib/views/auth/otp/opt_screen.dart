import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/utils/common/scaffoldmessenger.dart';
import 'package:slms/view_model/auth/auth_controller.dart';
import 'package:slms/views/auth/password/change_password.dart';
import 'package:slms/views/auth/widget/login_widget.dart';
import 'package:slms/views/widget/widget.dart';

// ignore: must_be_immutable
class OptScreen extends StatelessWidget {
  String email;
  OptScreen({super.key, required, required this.email});

  String opt = '';

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textStyled(text: "Verify Email", fontweight: FontWeight.bold),
        backgroundColor: ColorConstents.bagroundColor,
      ),
      backgroundColor: ColorConstents.bagroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 130),
              textStyled(
                  text: "Code is sent to $email",
                  color: Colors.grey,
                  fontSize: 16),
              const SizedBox(height: 20),
              PinCodeTextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                length: 6,
                appContext: context,
                onCompleted: (value) {
                  opt = value;
                },
                pinTheme: PinTheme(
                  activeFillColor: Colors.white,
                  activeColor: Colors.blue,
                  selectedColor: Colors.blue,
                  inactiveColor: Colors.grey,
                  disabledColor: Colors.grey.shade400,
                  fieldHeight: 58,
                  fieldWidth: 48,
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  log("Entered OTP: $opt");
                  context
                      .read<AuthenticationController>()
                      .verifyOtp(code: opt, email: email)
                      .then((value) {
                    if (value == "Successfully Verified the otp") {
                      Navigator.push(
                          // ignore: use_build_context_synchronously
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePasswordScreen(email: email,)));
                                                // ignore: use_build_context_synchronously
                                                scaffoldmessenger(context, value??"", Colors.grey);
                    }
                    // ignore: use_build_context_synchronously
                  scaffoldmessenger(context, value??"", Colors.grey);
                  });
                },
                child: containerBtn(text: 'Verify', context: context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
