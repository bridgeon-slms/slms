import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:slms/widget/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 20,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage('assets/image/shibili.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 130,
                      bottom: 25,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withAlpha(100),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textStyled(
                                        text: 'Rinshid ch',
                                        fontweight: FontWeight.bold,
                                        fontSize: 18),
                                    Row(
                                      children: [
                                        Icon(Iconsax.buliding, size: 15),
                                        Gap(3),
                                        textStyled(
                                            text: 'Neo Space 2', fontSize: 14),
                                      ],
                                    ),
                                    Gap(3),
                                    Row(
                                      children: [
                                        Icon(Icons.group, size: 17),
                                        Gap(3),
                                        textStyled(
                                            text: 'Batch: C28', fontSize: 14),
                                        Gap(20),
                                        Icon(Icons.calendar_month, size: 17),
                                        Gap(3),
                                        textStyled(
                                            text: 'Week 17', fontSize: 14),
                                      ],
                                    ),
                                  ])))),
                  Positioned(
                      bottom: 0,
                      right: 10,
                      child: Row(
                        children: [
                          socialContainers(
                            ontap: () async {
                              final url = Uri.parse(
                                  'https://leetcode.com/u/rinshid10/');
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url,
                                    mode: LaunchMode.externalApplication);
                              } else {
                                throw "Could not launch $url";
                              }
                            },
                            path: 'assets/image/LeetCode_logo_rvs.png',
                            colors: Colors.black,
                          ),
                          Gap(10),
                          socialContainers(path: 'assets/image/Link.png'),
                          Gap(10),
                          socialContainers(path: 'assets/image/git.png')
                        ],
                      ))
                ],
              ),
              Divider(),
              Gap(10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textStyled(
                              text: 'Contact Information :',
                              fontweight: FontWeight.bold,
                              fontSize: 16),
                          Gap(20),
                          informationsRow(
                              icons: Iconsax.message,
                              text: 'rinshidch@gmail.com'),
                          Gap(10),
                          informationsRow(
                              icons: Iconsax.call, text: '9188872619'),
                          Gap(10),
                          informationsRow(
                              icons: Iconsax.location,
                              text:
                                  'Valoor (H) Thekkan kuttur (po)Thalakkad pfdfdfdfdanchayathPin: 676551,tirur Malappuram '),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textStyled(
                          text: 'Academic Info:',
                          fontweight: FontWeight.bold,
                          fontSize: 16),
                      Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          textStyled(
                            text: 'Branch',
                            fontweight: FontWeight.bold,
                          ),
                          textStyled(text: '-'),
                          textStyled(
                            text: 'Kakkanchery',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row informationsRow({required IconData? icons, required String text}) {
    return Row(
      children: [
        Icon(icons),
        Gap(7),
        Expanded(child: textStyled(text: text, fontSize: 16, maxline: 5))
      ],
    );
  }

  GestureDetector socialContainers(
      {Color? colors, required String path, VoidCallback? ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            color: colors, borderRadius: BorderRadius.circular(5)),
        child: Image.asset(path),
      ),
    );
  }
}
