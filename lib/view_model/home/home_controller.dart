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
    isError = false;
    notifyListeners();

    try {
      final results = await Future.wait([
        services.fetchLeetCodeModel(),
        services.getAcadamicScore(),
        services.getLeetcodeId(),
        services.fetchFeesData(),
        profileServices.getAllProfileDatas()
      ]);
      leetcodeModel = results[0] as LeetcodeModel;
      score = results[1] as ReviewResponse;
      payments = results[3] as FeesApiResponse;
      profile = results[4] as ProfileModel;
    } catch (e) {
      log('Error fetching data: $e');
      isError = true;
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
