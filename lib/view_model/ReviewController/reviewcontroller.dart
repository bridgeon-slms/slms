import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:slms/model/ReviewModel/review.dart';
import 'package:slms/services/ReviewModel/review.dart';

class Reviewcontroller extends ChangeNotifier {
  ReviewServices ser = ReviewServices();
  List<ReviewData> reviewList = [];
  bool isLoding = false;
  double markTotel = 0;

  bool textTrue = false;
  void textVisible() {
    textTrue = !textTrue;
    notifyListeners();
  }

  getAllDataFromReview() async {
    isLoding = false;
    try {
      reviewList = await ser.getAllReviewDatas();
      totelScoreCheacker();
      log('succes to get data from review api');
      log('markkkkkkkkkkkkkkkkkkkk $markTotel');

      log('length or reveiw list is ---${reviewList.length}---');
      notifyListeners();
    } catch (e) {
      log('errro found in attentence provider or functios $e');
    } finally {
      isLoding = false;
      notifyListeners();
    }
  }

  double totelScoreCheacker() {
    double totel = 0;
    double totelTask = 0;
    double displine = 0;

    double accTotel = 0;
    var review = reviewList.map((e) => e.academic?.review ?? 0).toList();
    var task = reviewList.map((e) => e.academic?.task ?? 0).toList();
    var acc = reviewList.map((e) => e.others?.attendance ?? 0).toList();
    var dis = reviewList.map((e) => e.others?.discipline ?? 0).toList();

    if (review.isNotEmpty && task.isNotEmpty) {
      totel = review.reduce((b, c) => b + c);
      totelTask = task.reduce((b, c) => b + c);
      accTotel = acc.reduce((b, c) => b + c);

      displine = dis.reduce((b, c) => b + c);
    }
    // log('The total acc is $accTotel');
    // log('The total dis is $displine');
    var sum = totelTask + totel + displine + accTotel;
    log('sum is $sum');
    markTotel = sum;
    return sum;
  }
}
