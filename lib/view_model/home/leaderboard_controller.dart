import 'package:flutter/cupertino.dart';
import 'package:slms/model/dashboard.dart';
import 'package:slms/services/home_services.dart';

class LeaderboardController extends ChangeNotifier {
  HomeServices services = HomeServices();
List<LeaderBoardModel> leaderboardData = [];
  void getLeaderBoardData() async {
    try {
   leaderboardData =   await services.leaderBoardData();
    } catch (e) {}
  }
}
