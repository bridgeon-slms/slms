import 'package:flutter/material.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/utils/image/image.dart';
import 'package:slms/views/login/login_widget.dart';
import 'package:slms/widget/widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstents.bagroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(
                  ImageConstents.bridgeonLogo,
                  width: 50,
                ),
                Column(
                  children: [
                    Text(
                      "Bridgeon",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                    Text("code you future"),
                  ],
                ),
              ],
            ),
            costumTextfeild(),
            costumTextfeild(),
            textStyled(text: 'Forget Password', color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: textStyled(text: ''),
                decoration: BoxDecoration(
                    color: ColorConstents.primeryColor,
                    borderRadius: BorderRadius.circular(10)),
                width: double.infinity,
                height: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
