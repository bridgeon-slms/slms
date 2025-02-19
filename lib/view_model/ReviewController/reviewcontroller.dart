import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:slms/model/ReviewModel/review.dart';
import 'package:slms/services/ReviewModel/review.dart';

class Reviewcontroller extends ChangeNotifier {
  ReviewServices ser = ReviewServices();
  List<ReviewData> reviewList = [];
  getAllDataFromReview() async {
    try {
      reviewList = await ser.getAllReviewDatas();
      log('succes to get data from attendence api');

      log('length or attendence list is ---${reviewList.length}---');
      notifyListeners();
    } catch (e) {
      log('errro found in attentence provider or functios $e');
    }
  }
}
