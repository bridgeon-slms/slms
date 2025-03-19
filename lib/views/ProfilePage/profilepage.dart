import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:slms/helpers/helpers.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/view_model/home/home_controller.dart';
import 'package:slms/views/auth/login/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
          ),
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: ColorConstents.bagroundColor,
        body: SingleChildScrollView(
          child: Consumer<HomeController>(
            builder: (context, profile, child) => Column(children: [
              Stack(
                children: [
                  Positioned(
                    child: Hero(
                      tag: 'profile',
                      child: Container(
                        height: 370,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                onError: (exception, stackTrace) =>
                                    Icon(Icons.error),
                                opacity: 0.60,
                                image: NetworkImage(
                                  profile.profile?.image ?? '',
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
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
                          onError: (exception, stackTrace) => Icon(Icons.error),
                          image: NetworkImage(profile.profile?.image ?? ''),
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
                                        text: profile.profile?.name ?? 'name',
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
                                            text: profile.profile?.batch.name ??
                                                '',
                                            fontSize: 14),
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
                                  'https://leetcode.com/u/${profile.profile?.socialLinks.leetCode}');
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
                    height: 400,
                    width: double.infinity,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              socialContainers(
                                ontap: () async {
                                  final url = Uri.parse(
                                      'https://leetcode.com/u/${profile.profile!.socialLinks.leetCode}');
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
                                      'https://leetcode.com/u/${profile.profile!.socialLinks.linkedIn}');
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
                                      'https://leetcode.com/u/${profile.profile!.socialLinks.github}');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url,
                                        mode: LaunchMode.externalApplication);
                                  } else {
                                    throw "Could not launch $url";
                                  }
                                },
                              )
                            ],
                          ),
                          Gap(30),
                          textStyled(
                              text: 'Contact Information :',
                              fontweight: FontWeight.bold,
                              fontSize: 16),
                          Gap(20),
                          informationsRow(
                              icons: Iconsax.message,
                              text: profile.profile?.email ?? ''),
                          Gap(10),
                          informationsRow(
                              icons: Iconsax.call,
                              text: profile.profile?.phone ?? ''),
                          Gap(10),
                          informationsRow(
                              icons: Iconsax.location,
                              text: profile.profile?.address ?? ''),
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
                        acadamicInfo(
                            text: 'Branch',
                            text2: profile.profile?.branch.name ?? ''),
                        acadamicInfo(
                            text: 'Space',
                            text2: profile.profile?.space.name ?? ''),
                        acadamicInfo(
                            text: 'Week',
                            text2: profile.profile!.week.toString()),
                        acadamicInfo(
                            text: 'Advisor',
                            text2: profile.profile?.advisor.name ?? ''),
                        acadamicInfo(
                            text: 'Mentor',
                            text2: profile.profile!.mentor.name!),
                        acadamicInfo(
                            text: 'Qualification',
                            text2: profile.profile?.qualification.name ?? ''),
                        acadamicInfo(
                            text: 'Joining Date',
                            text2: formatDate(DateTime.parse(
                                profile.profile?.joiningDate ?? ''))),
                        acadamicInfo(
                            text: 'Course Type',
                            text2: profile.profile?.courseType ?? ''),
                        acadamicInfo(
                            text: 'Domain',
                            text2: profile.profile?.course.name ?? ''),
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
                                  foregroundColor: Colors.white,
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
                                  foregroundColor: Colors.white,
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
                            text2: profile.profile?.institution.name ?? '',
                            icon: Icons.school),
                        acadamicInfo(
                            text: 'PassOut Year',
                            text2: profile.profile?.passOutYear ?? '',
                            icon: Iconsax.calendar),
                        acadamicInfo(
                            text: 'Week',
                            text2: profile.profile!.week.toString(),
                            icon: Iconsax.clock),
                        Gap(5),
                        textStyled(
                            text: 'Guardian:',
                            fontweight: FontWeight.bold,
                            fontSize: 18),
                        Gap(10),
                        acadamicInfo(
                            text: 'Name',
                            text2: profile.profile?.guardian.name ?? '',
                            icon: Icons.person),
                        acadamicInfo(
                            text: 'Relationship',
                            text2: profile.profile?.guardian.relationship ?? '',
                            icon: Icons.family_restroom),
                        acadamicInfo(
                            text: 'Phone',
                            text2: profile.profile?.guardian.phone ?? '',
                            icon: Iconsax.call),
                        Gap(10),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                                (route) => false,
                              );
                              FlutterSecureStorage storage =
                                  FlutterSecureStorage();
                              storage.deleteAll();
                            },
                            child: Text('Logout'))
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }

  Widget acadamicInfo({
    required String text,
    required String text2,
    IconData? icon,
  }) {
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
              SizedBox(
                width: 150, // Adjust the width as needed
                child: textStyled(
                  text: text,
                  fontSize: 17,
                  fontweight: FontWeight.bold,
                  maxline: 2,
                  textoverflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Expanded(
            child: textStyled(
              text: text2,
              fontSize: 17,
              maxline: 2,
              textoverflow: TextOverflow.ellipsis,
            ),
          ),
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

  Text textStyled({
    required String text,
    double? fontSize,
    FontWeight? fontweight,
    int? maxline,
    TextOverflow? textoverflow,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontweight,
      ),
      maxLines: maxline,
      overflow: textoverflow,
    );
  }
}
