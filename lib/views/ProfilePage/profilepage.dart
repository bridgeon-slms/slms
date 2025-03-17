import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:slms/helpers/helpers.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/view_model/profilecontroller/profilecontroller.dart';
import 'package:slms/views/auth/login/login_screen.dart';
import 'package:slms/views/widget/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Profilecontroller>(context, listen: false)
          .getAllProfileData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return context.watch<Profilecontroller>().isLodding
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
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
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: Consumer<Profilecontroller>(
                          builder: (context, value, child) {
                            return Hero(
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
                                          value.profileList[0].image,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        left: 20,
                        child: Consumer<Profilecontroller>(
                          builder: (context, value, child) {
                            return Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  onError: (exception, stackTrace) =>
                                      Icon(Icons.error),
                                  image:
                                      NetworkImage(value.profileList[0].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                          left: 130,
                          bottom: 33,
                          child: Consumer<Profilecontroller>(
                              builder: (context, value, child) {
                            if (value.profileList.isEmpty) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            return Container(
                                decoration: BoxDecoration(
                                    color: Colors.white.withAlpha(100),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          textStyled(
                                              text: value.profileList[0].name,
                                              fontweight: FontWeight.bold,
                                              fontSize: 18),
                                          Row(
                                            children: [
                                              Icon(Iconsax.buliding, size: 15),
                                              Gap(3),
                                              textStyled(
                                                  text: 'Neo Space 2',
                                                  fontSize: 14),
                                            ],
                                          ),
                                          Gap(3),
                                          Row(
                                            children: [
                                              Icon(Icons.group, size: 17),
                                              Gap(3),
                                              textStyled(
                                                  text: value.profileList[0]
                                                      .batch.name,
                                                  fontSize: 14),
                                              Gap(20),
                                              Icon(Icons.calendar_month,
                                                  size: 17),
                                              Gap(3),
                                              textStyled(
                                                  text: 'Week 17',
                                                  fontSize: 14),
                                            ],
                                          ),
                                        ])));
                          })),
                      Consumer<Profilecontroller>(
                        builder: (context, value, child) => Positioned(
                            bottom: 0,
                            right: 10,
                            child: Row(
                              children: [
                                socialContainers(
                                  ontap: () async {
                                    final url = Uri.parse(
                                        'https://leetcode.com/u/${value.profileList.first.socialLinks.leetCode}');
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
                            )),
                      )
                    ],
                  ),
                  Divider(),
                  Gap(10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<Profilecontroller>(
                      builder: (context, value, child) => Card(
                        color: ColorConstents.bagroundColor,
                        elevation: 2,
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
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
                                    text: value.profileList.first.email),
                                Gap(10),
                                informationsRow(
                                    icons: Iconsax.call,
                                    text: value.profileList[0].phone),
                                Gap(10),
                                informationsRow(
                                    icons: Iconsax.location,
                                    text: value.profileList[0].address),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Consumer<Profilecontroller>(
                      builder: (context, value, child) => Card(
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
                                  text2: value.profileList[0].branch.name!),
                              acadamicInfo(
                                  text: 'Space',
                                  text2: value.profileList[0].space.name!),
                              acadamicInfo(
                                  text: 'Week',
                                  text2: value.profileList[0].week.toString()),
                              acadamicInfo(
                                  text: 'Advisor',
                                  text2: value.profileList[0].advisor.name!),
                              acadamicInfo(
                                  text: 'Mentor',
                                  text2: value.profileList[0].mentor.name!),
                              acadamicInfo(
                                  text: 'Qualification',
                                  text2:
                                      value.profileList[0].qualification.name!),
                              acadamicInfo(
                                  text: 'Joining Date',
                                  text2: formatDate(DateTime.parse(
                                      value.profileList[0].joiningDate!))),
                              acadamicInfo(
                                  text: 'Course Type',
                                  text2: value.profileList[0].courseType!),
                              acadamicInfo(
                                  text: 'Domain',
                                  text2: value.profileList[0].course.name),
                              Gap(10),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton.icon(
                                      onPressed: () {},
                                      icon: Icon(Iconsax.document,
                                          color: Colors.white),
                                      label: Text('Resume',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(20),
                                  Expanded(
                                    child: ElevatedButton.icon(
                                      onPressed: () {},
                                      icon: Icon(Iconsax.document,
                                          color: Colors.white),
                                      label: Text('Document',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            ColorConstents.primeryColor,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                  ),
                  Gap(10),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Consumer<Profilecontroller>(
                      builder: (context, value, child) => Card(
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
                                  text2: value.profileList[0].institution.name!,
                                  icon: Icons.school),
                              acadamicInfo(
                                  text: 'PassOut Year',
                                  text2: value.profileList[0].passOutYear!,
                                  icon: Iconsax.calendar),
                              acadamicInfo(
                                  text: 'Week',
                                  text2: value.profileList[0].week.toString(),
                                  icon: Iconsax.clock),
                              Gap(5),
                              textStyled(
                                  text: 'Guardian:',
                                  fontweight: FontWeight.bold,
                                  fontSize: 18),
                              Gap(10),
                              acadamicInfo(
                                  text: 'Name',
                                  text2: value.profileList[0].guardian.name,
                                  icon: Icons.person),
                              acadamicInfo(
                                  text: 'Relationship',
                                  text2: value
                                      .profileList[0].guardian.relationship,
                                  icon: Icons.family_restroom),
                              acadamicInfo(
                                  text: 'Phone',
                                  text2: value.profileList[0].guardian.phone,
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
                maxline: 1,
                textoverflow: TextOverflow.ellipsis,
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
