import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/widget/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: ColorConstents.bagroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 270,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          opacity: 0.70,
                          image: NetworkImage(
                              'https://media.istockphoto.com/id/1364917563/photo/businessman-smiling-with-arms-crossed-on-white-background.jpg?s=612x612&w=0&k=20&c=NtM9Wbs1DBiGaiowsxJY6wNCnLf0POa65rYEwnZymrM='),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  bottom: 30,
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
                    bottom: 33,
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
                        socialContainers(
                          path: 'assets/image/Link.png',
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
                        ),
                        Gap(10),
                        socialContainers(
                          path: 'assets/image/git.png',
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
                        )
                      ],
                    ))
              ],
            ),
            Divider(),
            Gap(10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: ColorConstents.bagroundColor,
                elevation: 2,
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 2,
                color: ColorConstents.bagroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textStyled(
                          text: 'Academic Info:',
                          fontweight: FontWeight.bold,
                          fontSize: 18),
                      Gap(10),
                      acadamicInfo(text: 'Branch', text2: 'Kakkanchery'),
                      acadamicInfo(text: 'Space', text2: 'Neo Space 2'),
                      acadamicInfo(text: 'Week', text2: '17'),
                      acadamicInfo(text: 'Advisor', text2: 'SHIBIL HAROON'),
                      acadamicInfo(text: 'Mentor', text2: 'SHIBIL HAROON'),
                      acadamicInfo(text: 'Qualification', text2: 'Plus Two'),
                      acadamicInfo(
                          text: 'Joining Date', text2: '28 May 2024'),
                      acadamicInfo(text: 'Course Type', text2: 'Offline'),
                      acadamicInfo(text: 'Domain', text2: 'Flutter'),
                      Gap(10),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon:
                                  Icon(Iconsax.document, color: Colors.white),
                              label: Text('Resume',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white, // Text color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          Gap(20),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon:
                                  Icon(Iconsax.document, color: Colors.white),
                              label: Text('Document',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorConstents.primeryColor,
                                foregroundColor: Colors.white, // Text color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 2,
                color: ColorConstents.bagroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textStyled(
                          text: 'Personal Info',
                          fontweight: FontWeight.bold,
                          fontSize: 18),
                      Gap(10),
                      acadamicInfo(
                          text: 'Institution',
                          text2: 'MSP HSS MALPPURAM',
                          icon: Icons.school),
                      acadamicInfo(
                          text: 'PassOut Year',
                          text2: 'Neo Space 2',
                          icon: Iconsax.calendar),
                      acadamicInfo(
                          text: 'Week', text2: '2024', icon: Iconsax.clock),
                      Gap(5),
                      textStyled(
                          text: 'Guardian:',
                          fontweight: FontWeight.bold,
                          fontSize: 18),
                      Gap(10),
                      acadamicInfo(
                          text: 'Name',
                          text2: 'Abdu samad ch',
                          icon: Icons.person),
                      acadamicInfo(
                          text: 'Relationship',
                          text2: 'FATHER',
                          icon: Icons.family_restroom),
                      acadamicInfo(
                          text: 'Phone',
                          text2: '9746732741',
                          icon: Iconsax.call),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget acadamicInfo(
      {required String text, required String text2, IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18),
                Gap(5),
              ],
              textStyled(
                text: text,
                fontSize: 17,
                fontweight: FontWeight.bold,
              ),
            ],
          ),
          textStyled(text: text2, fontSize: 17),
        ],
      ),
    );
  }

  Widget informationsRow({required IconData? icons, required String text}) {
    return Row(
      children: [
        Icon(icons),
        Gap(7),
        Expanded(child: textStyled(text: text, fontSize: 16, maxline: 5))
      ],
    );
  }

  Widget socialContainers(
      {Color? colors, required String path, VoidCallback? ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
            color: colors, borderRadius: BorderRadius.circular(5)),
        child: Image.asset(path),
      ),
    );
  }
}
