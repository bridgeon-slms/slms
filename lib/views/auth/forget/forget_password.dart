import 'package:flutter/material.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/utils/image/image.dart';
import 'package:slms/views/auth/otp/opt_screen.dart';
import 'package:slms/views/auth/widget/login_widget.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: ColorConstents.bagroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            spacing: 20,
            children: [
              SizedBox(height: 70,),
              Row(
                children: [
                  Image.asset(
                    ImageConstents.bridgeonLogo,
                    width:50,
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
              SizedBox(height: 30,),
              costumTextfeild(hintText: 'Email'),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OptScreen()));
                },
                child: containerBtn(text: 'Send OTP')),
            ],
          ),
        ),
      ),
    );
  }
}
