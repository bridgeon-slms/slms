import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/views/auth/widget/login_widget.dart';
import 'package:slms/widget/widget.dart';

class OptScreen extends StatelessWidget {
  const OptScreen({super.key});

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
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 130,
              ),
              textStyled(
                  text: "Code is send to sinan@gmail.com",
                  color: Colors.grey,
                  fontSize: 17),
              PinCodeTextField(
                keyboardType: TextInputType.number,
                length: 6,
                appContext: context,
                pinTheme: PinTheme(
                  
                  activeFillColor: Colors.white,
                  activeColor: Colors.blue,
                  selectedColor: Colors.blue,
                  inactiveColor: Colors.grey,
                  disabledColor: Colors.grey.shade400,
                  fieldHeight: 58,
                  fieldWidth: 48,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              containerBtn(text: 'Verify'),
            ],
          ),
        ),
      ),
    );
  }
}
