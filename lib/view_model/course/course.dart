import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:slms/model/course/cartogary.dart';
import 'package:slms/model/course/subcatogary.dart';
import 'package:slms/services/course/course.dart';

class CourseController extends ChangeNotifier {
  List<CartogaryModel> weekData = [];
  List<CourseModel> allCourse = [];
  List<SubCategory> subcategories = [];
  List<Topic> topicData = [];
  ReviewServices reviewServices = ReviewServices();

  Future<List<CartogaryModel>?> getWeekData({required String courseId}) async {
    try {
      weekData = (await reviewServices.getReviewCatogary(courseId))!;
      return weekData;
      // ignore: empty_catches
    } catch (e) {}
    notifyListeners();
    return null;
  }

  Future<void> getSubCatogary(
      {required String courseID, required String categoryId}) async {
    try {
      subcategories =
          await reviewServices.fetchSubCategories(courseID, categoryId);
      log(subcategories.first.courseId.toString());
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void> getTopics({
    required String courseID,
    required String categoryId,
  }) async {
    try {
      topicData = await reviewServices.fetchTopics(courseID, categoryId);

      if (topicData.isNotEmpty) {
        print(topicData.first.description);
      } else {
        print('No topics available or description is null');
      }
    } catch (e) {
      log('Error fetching topics: $e');
    }
    notifyListeners();
  }

  Future<void> getAllCourse() async {
    try {
      allCourse = await reviewServices.fetchCourses();
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
