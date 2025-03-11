import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:slms/model/course/cartogary.dart';
import 'package:slms/model/course/subcatogary.dart';
import 'package:slms/services/course/course.dart';

class CourseController extends ChangeNotifier {
  List<String> weekData = [];
  List<CourseModel> allCourse =[];
  List<SubCategory> subcategories = [];
  List<Topic> topicData = [];
  ReviewServices reviewServices = ReviewServices();

  Future<List<String>?> getWeekData({required String courseId}) async {
    try {
      weekData = (await reviewServices.getReviewCatogary(courseId))!;
      return weekData;
      // ignore: empty_catches
    } catch (e) {}
    notifyListeners();
    return null;
  }

  Future<void> getSubCatogary() async {
    try {
      subcategories = await reviewServices.fetchSubCategories();
      log(subcategories.first.title.toString());
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void>getTopics()async{
    try {
      topicData = await reviewServices.fetchTopics();
      log(topicData.first.title);
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
  Future<void> getAllCourse()async{
    try {
      allCourse = await reviewServices.fetchCourses();
      log(allCourse.first.id);
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
