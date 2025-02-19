import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:slms/controller/profilecontroller/profilecontroller.dart';
import 'package:slms/utils/color/color.dart';

import 'package:slms/views/ProfilePage/profilepage.dart';
import 'package:slms/views/home/dashbord.dart';

import 'package:slms/view_model/home/leaderboard_controller.dart';
import 'package:slms/views/ProfilePage/profilepage.dart';

import 'package:slms/views/home/home_widgets.dart';
import 'package:slms/widget/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeController>(context, listen: false).getLeaderBoardData();
      Provider.of<HomeController>(context, listen: false).getLeetcodeData();
    });
    Provider.of<Profilecontroller>(context, listen: false).getAllProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return context.read<HomeController>().isLoading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              surfaceTintColor: Colors.white,
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Iconsax.message)),
                IconButton(onPressed: () {}, icon: Icon(Iconsax.notification)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (cont) => ProfilePage()));
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
      
                SizedBox(
                  width: 20,
                ),
              ],
              title: textStyled(
                  text: 'Hi,Name', fontweight: FontWeight.w400, fontSize: 16),
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
                      Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: leaderBoardWidget(context,
                              context.watch<HomeController>().leaderboardData)),
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
                              textStyled(
                                  text: 'You Acquired 82% of Total Score'),
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
                              textStyled(
                                  text: 'You Acquired 93% of Total Score'),
                            ],
                          ),
                          circulePercentange(),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Consumer<HomeController>(
                        builder: (context, controller, child) => Container(
                          decoration: BoxDecoration(
                              color: Color(0XFF191818),
                              borderRadius: BorderRadius.circular(8)),
                          height: 255,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30.0, top: 30),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  textStyled(
                                      text:
                                          '${controller.leetcodeData[0].data.acSubmissionNum[0].count}',
                                      fontSize: 40,
                                      fontweight: FontWeight.bold,
                                      color: Colors.white),
                                  Row(
                                    children: [
                                      Column(
                                        spacing: 20,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          textStyled(
                                              text:
                                                  '${controller.leetcodeData[0].data.acSubmissionNum[1].difficulty}',
                                              color: Colors.white,
                                              fontweight: FontWeight.bold,
                                              fontSize: 20),
                                          textStyled(
                                              text:
                                                  '${controller.leetcodeData[0].data.acSubmissionNum[2].difficulty}',
                                              color: Colors.white,
                                              fontweight: FontWeight.bold,
                                              fontSize: 20),
                                          textStyled(
                                              text:
                                                  '${controller.leetcodeData[0].data.acSubmissionNum[1].difficulty}',
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          textStyled(
                                              text:
                                                  '${controller.leetcodeData[0].data.acSubmissionNum[1].count}',
                                              color: Colors.green,
                                              fontweight: FontWeight.bold,
                                              fontSize: 20),
                                          textStyled(
                                              text:
                                                  '${controller.leetcodeData[0].data.acSubmissionNum[2].count}',
                                              color: Colors.yellow,
                                              fontweight: FontWeight.bold,
                                              fontSize: 20),
                                          textStyled(
                                              text:
                                                  '${controller.leetcodeData[0].data.acSubmissionNum[3].count}',
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
