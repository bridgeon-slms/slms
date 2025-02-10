import 'package:flutter/material.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/utils/image/image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstents.bagroundColor,
      body: Center(
        child: Column(
          children: [
             Row(
              crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 Image.asset(ImageConstents.bridgeonLogo,width: 50,),
                 Column(
                   children: [
                     Text("Bridgeon",style: TextStyle(
                      fontWeight: FontWeight.w900,fontSize: 20,
                     ),),
                     Text("code you future")
                   ],
                 ),
               ],
             ),
          ],
        ),
      ),
    );
  }
}