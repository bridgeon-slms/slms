import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:slms/model/dashboard.dart';
import 'package:slms/model/leetcode_model.dart';
import 'package:slms/services/home_services.dart';

class HomeController extends ChangeNotifier {
  final HomeServices services = HomeServices();
  List<LeaderboardData> leaderboardData = [];
  List<LeetcodeModel> leetcodeData = [];
  bool isLoading = false;

  Future<void> getLeaderBoardData() async {
    isLoading = true;
    notifyListeners();

    try {
      leaderboardData = await services.leaderBoardData();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getLeetcodeData() async {
    try {
      LeetcodeModel data = await services.fetchLeetCodeModel();

      leetcodeData = [data];
      if (leetcodeData.isNotEmpty) {
        log(leetcodeData.length.toString());
      } else {
        log('erroorr');
      }
      notifyListeners();
    } catch (e) {}
  }
}
