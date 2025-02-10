import 'package:flutter/material.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/views/home/dashbord.dart';
import 'package:slms/widget/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  actions: [
    IconButton(onPressed: (){}, icon: Icon(Icons.message)),
    IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active)),
    CircleAvatar(
      child: Icon(Icons.person),
    ),
  ],
  title: textStyled(text: 'Hi,Nifras',fontweight: FontWeight.w400),
  backgroundColor: ColorConstents.bagroundColor,
),
      backgroundColor: ColorConstents.bagroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
          
            DashbordGraph()
          ],
        ),
      ),
    );
  }
}