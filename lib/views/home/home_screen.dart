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
          IconButton(onPressed: () {}, icon: Icon(Icons.message)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_active)),
          CircleAvatar(
            child: Icon(Icons.person),
          ),
          SizedBox(
            width: 20,
          ),
        ],
        title: textStyled(text: 'Hi,', fontweight: FontWeight.w400),
        backgroundColor: ColorConstents.bagroundColor,
      ),
      backgroundColor: ColorConstents.bagroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
              ),
            ),
            DashbordGraph(),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey.shade400,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey.shade400,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey.shade400,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey.shade400,
                        )),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(color: Color(0XFF191818)),
              height: 255,
              width: double.infinity,
              child: Column(
                children: [
                  textStyled(
                      text: 'Leetcode \nstatics',
                      color: Colors.white,
                      fontweight: FontWeight.bold,
                      fontSize: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      textStyled(
                          text: '103',
                          fontSize: 40,
                          fontweight: FontWeight.bold,
                          color: Colors.white),
                      Row(
      
                        children: [
                          Column(
                            spacing: 20,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textStyled(
                                  text: 'Easy',
                                  color: Colors.white,
                                  fontweight: FontWeight.bold,
                                  fontSize: 20),
                              textStyled(
                                  text: 'Medium',
                                  color: Colors.white,
                                  fontweight: FontWeight.bold,
                                  fontSize: 20),
                              textStyled(
                                  text: 'Hard',
                                  color: Colors.white,
                                  fontweight: FontWeight.bold,
                                  fontSize: 20),
                            ],
                          ),
                          SizedBox(width: 20,),
                          Column(
                            spacing: 20,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textStyled(
                                  text: '80',
                                  color: Colors.green,
                                  fontweight: FontWeight.bold,
                                  fontSize: 20),
                              textStyled(
                                  text: '19',
                                  color: Colors.yellow,
                                  fontweight: FontWeight.bold,
                                  fontSize: 20),
                              textStyled(
                                  text: '04',
                                  color: Colors.red,
                                  fontweight: FontWeight.bold,
                                  fontSize: 20),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
