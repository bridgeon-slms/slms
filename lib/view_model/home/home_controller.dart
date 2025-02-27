import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:slms/model/dashboard.dart';
import 'package:slms/model/leetcode_model.dart';
import 'package:slms/model/notification.dart';
import 'package:slms/model/payments_model.dart';
import 'package:slms/model/score.dart';
import 'package:slms/services/home_services.dart';

class HomeController extends ChangeNotifier {
  final HomeServices services = HomeServices();
  List<LeaderboardData> leaderboardData = [];
  LeetcodeModel? leetcodeModel;
  ReviewResponse? score;
  String? leetcodeId;
  bool isError = false;
  FeesApiResponse? payments;
  bool isLoading = false;

  bool notificationLodding = false;

  NotificationResponse? notificationResponse;

  Future<void> fetchAllData() async {
    isLoading = true;
    notifyListeners();

    try {
      final results = await Future.wait([
        services.leaderBoardData(),
        services.fetchLeetCodeModel(),
        services.getAcadamicScore(),
        services.getLeetcodeId(),
        services.fetchFeesData(),
      ]);
      leaderboardData = results[0] as List<LeaderboardData>;
      leetcodeModel = results[1] as LeetcodeModel;
      score = results[2] as ReviewResponse;
      payments = results[4] as FeesApiResponse;
    } catch (e) {
      log('Error fetching data: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getNotification() async {
    notificationLodding = true;
    notifyListeners();
    try {
      notificationResponse = await services.fetchNotification();
    } catch (e) {
      isError = true;
    } finally {
      notificationLodding = false;
    }
    notifyListeners();
  }
}
