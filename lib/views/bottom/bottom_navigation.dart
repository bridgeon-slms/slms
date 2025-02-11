import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/view_model/bottom_bar.dart';
import 'package:slms/views/%20AttendancePage/%20AttendanceMain/%20attendance.dart';
import 'package:slms/views/home/home_screen.dart';
import 'package:slms/views/payments/payment_screen.dart';

class BottomBar extends StatelessWidget {
    List<Widget> bottomBarPages = [
    HomeScreen(),
    AttendancePage(),
PaymentScreen(),
    Container(),
  ];
   BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: bottomBarPages[context.watch<BottomBarController>().currentIndex],
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: context.read<BottomBarController>().currentIndex,
          onTap: (index) {
             context.read<BottomBarController>().changeBottomNavigationIndex(index);
          },
          backgroundColor: ColorConstents.bagroundColor,
          items: [
          SalomonBottomBarItem(icon: Icon(Iconsax.home), title: Text('Home')),
          SalomonBottomBarItem(
              icon: Icon(Iconsax.clock), title: Text('Attendance')),
          SalomonBottomBarItem(
              icon: Icon(Iconsax.money), title: Text('Payments')),
          SalomonBottomBarItem(
              icon: Icon(Iconsax.user), title: Text('Profile')),
        ]));
  }
}
