import 'dart:math';
import 'package:flutter/material.dart';
import 'package:slms/model/ReviewModel/review.dart';
import 'package:slms/services/ReviewModel/review.dart';

class Reviewcontroller extends ChangeNotifier {
  ReviewServices ser = ReviewServices();
  List<ReviewData> reviewList = [];
  bool isLoding = false;
  double markTotel = 0;
  bool isError = false;
  String? reviewDate;

  bool textTrue = false;
  void textVisible() {
    textTrue = !textTrue;
    notifyListeners();
  }

getAllDataFromReview() async {
  isLoding = true;
  isError = false;
  notifyListeners();

  try {
    reviewList = await ser.getAllReviewDatas();
    totelScoreCheacker();
    notifyListeners();
  } catch (e) {
    isError = true;
  } finally {
    isLoding = false; 
    notifyListeners();
  }
}


  List<num> totelScoreCheacker() {
    double totel = 0;
    double totelTask = 0;
    double displine = 0;
    double accTotel = 0;
    var review = reviewList.map((e) => e.academic?.review ?? 0).toList();
    var task = reviewList.map((e) => e.academic?.task ?? 0).toList();
    var acc = reviewList.map((e) => e.others?.attendance ?? 0).toList();
    var dis = reviewList.map((e) => e.others?.discipline ?? 0).toList();

//get maximum mark
    final maxReview = review.reduce(max);
    final maxTask = review.reduce(max);
    final maxDiciplne = review.reduce(max);
    final maxAttendace = review.reduce(max);

    final maximumMark = maxReview + maxTask + maxDiciplne + maxAttendace;

    if (review.isNotEmpty && task.isNotEmpty) {
      totel = review.reduce((b, c) => b + c).toDouble();
      totelTask = task.reduce((b, c) => b + c).toDouble();
      accTotel = acc.reduce((b, c) => b + c).toDouble();
      displine = dis.reduce((b, c) => b + c).toDouble();
    }
    var sum = totelTask + totel + displine + accTotel;
    markTotel = sum;
    return [sum, maximumMark];
  }

  List<double> getTotalReviewMArk() {
    var review = reviewList.map((e) => e.academic?.review ?? 0).toList();
    var task = reviewList.map((e) => e.academic?.task ?? 0).toList();
    var acc = reviewList.map((e) => e.others?.attendance ?? 0).toList();
    var dis = reviewList.map((e) => e.others?.discipline ?? 0).toList();

    List<double> totalReviewMArk = List.generate(
      review.length,
      (index) =>
          task[index] + review[index] + acc[index] + dis[index].toDouble(),
    );
    return totalReviewMArk;
  }

  void getReviewDatw() async {
    reviewDate = await ser.getReviewDate();

    notifyListeners();
  }
}
