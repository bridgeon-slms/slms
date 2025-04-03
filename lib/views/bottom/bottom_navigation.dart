import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/view_model/bottom_bar.dart';
import 'package:slms/views/%20AttendancePage/%20AttendanceMain/%20attendance.dart';
import 'package:slms/views/courses/coursess/courses.dart';
import 'package:slms/views/home/home_screen.dart';
import 'package:slms/views/reviews/reviews.dart';
import 'package:slms/views/task/task_screen.dart';

// ignore: must_be_immutable
class BottomBar extends StatelessWidget {
  List<Widget> bottomBarPages = [
    HomeScreen(),
    AttendancePage(),
    ReviewsPage(),
    CoursePage(),
    TaskScreen()
  ];
  BottomBar({super.key});
  @override
  Widget build(BuildContext context) {
    final index = context.watch<BottomBarController>().currentIndex;
    return Scaffold(
        body: bottomBarPages[index],
        bottomNavigationBar: SalomonBottomBar(
            currentIndex: context.read<BottomBarController>().currentIndex,
            onTap: (index) {
              context
                  .read<BottomBarController>()
                  .changeBottomNavigationIndex(index);
            },
            backgroundColor: ColorConstents.bagroundColor,
            items: [
              SalomonBottomBarItem(
                  icon: Icon(Iconsax.home), title: Text('Home')),
              SalomonBottomBarItem(
                  icon: Icon(Iconsax.clock), title: Text('Attendance')),
              SalomonBottomBarItem(
                  icon: Icon(Iconsax.chart), title: Text('Review')),
              SalomonBottomBarItem(
                  icon: Icon(Iconsax.book), title: Text('Courses')),
                   SalomonBottomBarItem(
                  icon: Icon(Iconsax.task), title: Text('Task')),
            ]));
  }
}
