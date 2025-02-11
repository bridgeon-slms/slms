import 'package:flutter/material.dart';

class BottomBarController extends ChangeNotifier {

  int currentIndex = 0;

  void changeBottomNavigationIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
