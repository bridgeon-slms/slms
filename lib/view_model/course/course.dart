import 'package:flutter/material.dart';
import 'package:slms/services/course.dart';

class CourseController extends ChangeNotifier {
  List<String> weekData = [];
  ReviewServices reviewServices = ReviewServices();

  Future<List<String>?> getWeekData() async {
    try {
      weekData = (await reviewServices.getReviewCatogary())!;
      return weekData;
    // ignore: empty_catches
    } catch (e) {}
    notifyListeners();
    return null;
  }
}
