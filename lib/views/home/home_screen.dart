import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/view_model/home/home_controller.dart';
import 'package:slms/views/ProfilePage/profilepage.dart'; // Fixed import
import 'package:slms/views/home/home_widgets.dart';
import 'package:slms/views/home/notifications/notification.dart';
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
      Provider.of<HomeController>(context, listen: false).fetchAllData();
    });
  }
  @override
  Widget build(BuildContext context) {
    final homeController = context.watch<HomeController>();

    return homeController.isLoading
        ? Container(
          color: Colors.white,
          child: const Center(child: CircularProgressIndicator()))
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              surfaceTintColor: Colors.white,
              actions: [
                IconButton(onPressed: () {
   
                }, icon: const Icon(Iconsax.message)),
                IconButton(
                    onPressed: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationS()));
                    }, icon: const Icon(Iconsax.notification)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (cont) => const ProfilePage()));
                  },
                  child: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                ),
                const SizedBox(width: 20),
              ],
              title: textStyled(
                  text: 'Hi, Name', fontweight: FontWeight.w400, fontSize: 16),
              backgroundColor: ColorConstents.bagroundColor,
            ),
            backgroundColor: ColorConstents.bagroundColor,
            body: RefreshIndicator(
              onRefresh: () async {
                await homeController.fetchAllData();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: leaderBoardWidget(
                              context, homeController.leaderboardData)),
                      Consumer<HomeController>(
                          builder: (context, provider, child) {
                        final acadamic = provider.score?.data.first.academic;
                        final others = provider.score?.data.first.others;
                        return Column(
                          children: [
                            Row(
                              children: [
                                attendaceContainer(
                                  icon: Icons.abc,
                                  percetange: "${acadamic?.review}",
                                  text: 'Review',
                                ),
                                const SizedBox(width: 10),
                                attendaceContainer(
                                  icon: Icons.abc,
                                  percetange: "${acadamic?.task}",
                                  text: 'Task',
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                attendaceContainer(
                                  icon: Icons.abc,
                                  percetange: "${others?.attendance}",
                                  text: 'Attendance',
                                ),
                                const SizedBox(width: 10),
                                attendaceContainer(
                                  icon: Icons.abc,
                                  percetange: "${others?.discipline}",
                                  text: 'Discipline',
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                      const SizedBox(height: 30),
                      textStyled(text: 'Total Score', fontSize: 19),
                      Consumer<HomeController>(
                          builder: (context, value, child) {
                        if (value.score?.data == null ||
                            value.score!.data.isEmpty) {
                          return SizedBox();
                        }
                      
                        final academic = value.score?.data.first.academic;
                        final others = value.score?.data.first.others;
                        if (academic == null) {}
                        double academicMark =
                            (academic?.review ?? 0) + (academic?.task ?? 0);
                        double acadamicper = academicMark / 20;
                      
                        acadamicper = acadamicper.clamp(0.0, 1.0);
                        log(others!.attendance.toString());
                        double othersMark =
                            (others.attendance) + (others.discipline);
                        double othersPercentage = othersMark / 20;
                      
                        othersPercentage = othersPercentage.clamp(0.0, 1.0);
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    textStyled(
                                      text: 'Acadamic',
                                      fontweight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                circulePercentange(acadamicper),
                              ],
                            ),
 Padding(
   padding: const EdgeInsets.all(8.0),
   child: Divider(),
 ),
                            Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    textStyled(
                                      text: 'Others',
                                      fontweight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                circulePercentange(othersPercentage),
                              ],
                            ),
                          ],
                        );
                      }),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Divider(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textStyled(
                                  text: 'Others', fontweight: FontWeight.bold),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      pendingPayments(),
                      const SizedBox(height: 30),
                      Consumer<HomeController>(
                        builder: (context, controller, child) => Container(
                          decoration: BoxDecoration(
                              color: const Color(0XFF191818),
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
                                  children: [
                                    Image.asset(
                                      'assets/image/LeetCode_logo_rvs.png',
                                      width: 40,
                                    ),
                                    const SizedBox(width: 10),
                                    textStyled(
                                        text: 'Leetcode \nStatistics',
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
                                          '${controller.leetcodeModel?.data.acSubmissionNum[0].count ?? 0}',
                                      fontSize: 40,
                                      fontweight: FontWeight.bold,
                                      color: Colors.white),
                                  Row(
                                    children: [
                                      Column(
                                        spacing: 10,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          textStyled(
                                              text: controller
                                                      .leetcodeModel
                                                      ?.data
                                                      .acSubmissionNum[1]
                                                      .difficulty ??
                                                  'N/A',
                                              color: Colors.white,
                                              fontweight: FontWeight.bold,
                                              fontSize: 20),
                                          textStyled(
                                              text: controller
                                                      .leetcodeModel
                                                      ?.data
                                                      .acSubmissionNum[2]
                                                      .difficulty ??
                                                  'N/A',
                                              color: Colors.white,
                                              fontweight: FontWeight.bold,
                                              fontSize: 20),
                                          textStyled(
                                              text: controller
                                                      .leetcodeModel
                                                      ?.data
                                                      .acSubmissionNum[3]
                                                      .difficulty ??
                                                  'N/A',
                                              color: Colors.white,
                                              fontweight: FontWeight.bold,
                                              fontSize: 20),
                                        ],
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        spacing: 10,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          textStyled(
                                              text:
                                                  '${controller.leetcodeModel?.data.acSubmissionNum[1].count ?? 0}',
                                              color: Colors.green,
                                              fontweight: FontWeight.bold,
                                              fontSize: 20),
                                          textStyled(
                                              text:
                                                  '${controller.leetcodeModel?.data.acSubmissionNum[2].count ?? 0}',
                                              color: Colors.yellow,
                                              fontweight: FontWeight.bold,
                                              fontSize: 20),
                                          textStyled(
                                              text:
                                                  '${controller.leetcodeModel?.data.acSubmissionNum[3].count ?? 0}',
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
