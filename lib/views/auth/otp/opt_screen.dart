import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/view_model/auth/auth_controller.dart';
import 'package:slms/views/auth/widget/login_widget.dart';
import 'package:slms/widget/widget.dart';

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
                      .verifyOtp(code: opt, email: email).then((value){
                        log(value.toString());
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
