import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:slms/model/dashboard.dart';
import 'package:slms/model/leetcode_model.dart';
import 'package:slms/model/notification.dart';
import 'package:slms/model/payments_model.dart';
import 'package:slms/model/profilemodel/profilemodel.dart';
import 'package:slms/model/score.dart';
import 'package:slms/services/home_services.dart';
import 'package:slms/services/profileservices/profileservices.dart';

class HomeController extends ChangeNotifier {
  final HomeServices services = HomeServices();
  ProfileServices profileServices = ProfileServices();
  List<LeaderboardData> leaderboardData = [];
  LeetcodeModel? leetcodeModel;
  ReviewResponse? score;
  String? leetcodeId;
  bool isError = false;
  FeesApiResponse? payments;
  bool isLoading = false;
ProfileModel? profile;
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
        profileServices.getAllProfileDatas()
      ]);
      // leaderboardData = results[0] as List<LeaderboardData>;
      leetcodeModel = results[1] as LeetcodeModel;
      score = results[2] as ReviewResponse;
      payments = results[4] as FeesApiResponse;
      profile = results[5] as ProfileModel;

    } catch (e) {
      log('Error fetching data: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
    notifyListeners();
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
