import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/views/home/dashbord.dart';
import 'package:slms/views/home/home_widgets.dart';
import 'package:slms/widget/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Iconsax.message)),
          IconButton(onPressed: () {}, icon: Icon(Iconsax.notification)),
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
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
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
                    attendaceContainer(),
                    attendaceContainer(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  spacing: 10,
                  children: [
                    attendaceContainer(),
                    attendaceContainer(),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                textStyled(text: 'Total Score', fontSize: 19),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textStyled(
                          text: 'You Scored 527. out of 640',
                          fontweight: FontWeight.bold,
                        ),
                        textStyled(text: 'You Acquired 82% of Total Score'),
                      ],
                    ),
                    circulePercentange(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Divider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textStyled(
                            text:
                                'Highest Total score  in a Review: 37 out of 40',
                            fontweight: FontWeight.bold),
                        textStyled(text: 'You Acquired 93% of Total Score'),
                      ],
                    ),
                    circulePercentange(),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0XFF191818),
                      borderRadius: BorderRadius.circular(8)),
                  height: 255,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Image.asset(
                              'assets/image/LeetCode_logo_rvs.png',
                              width: 40,
                            ),
                            textStyled(
                                text: 'Leetcode \nstatics',
                                color: Colors.white,
                                fontweight: FontWeight.bold,
                                fontSize: 18),
                          ],
                        ),
                      ),
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
                              SizedBox(
                                width: 20,
                              ),
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
        ),
      ),
    );
  }
}
