import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:slms/model/course/cartogary.dart';
import 'package:slms/model/course/subcatogary.dart';
import 'package:slms/model/profilemodel/profilemodel.dart';
import 'package:slms/services/course/course.dart';
import 'package:slms/services/course/maincourseservises.dart';

class CourseController extends ChangeNotifier {
  List<CartogaryModel> weekData = [];
  List<CourseModel> allCourse = [];
  List<SubCategory> subcategories = [];
  List<Topic> topicData = [];
  List<Course> fullcourse = [];
  ReviewServices reviewServices = ReviewServices();
  Maincourseservises servises = Maincourseservises();
  bool isLodding = false;

  List<int> catogaryNumber = [];
  List<int> subCatogaryNumber = [];
  List<int> topicNumber = [];

  void getWeekData({required String courseId}) async {
    isLodding = true;
    notifyListeners();
    try {
      weekData = (await reviewServices.getReviewCatogary(courseId))!;
    } catch (e) {
      log(e.toString());
    } finally {
      isLodding = false;
    }
    notifyListeners();
  }

  Future<void> fullAllcourse() async {
    log("fetching all courses");
    try {
      fullcourse = await servises.fetchAllCourses();
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
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

  List<Map<String, dynamic>> getCategoryNumber() {
    return allCourse
        // ignore: unnecessary_null_comparison
        .where((e) => e.catogaryNumber != null)
        .map((e) => {'catogaryNumber': e.catogaryNumber, 'name': e.name})
        .toList();
  }

  List<Map<String, dynamic>> getSubCatogaryNumber() {
    return allCourse
        .map((e) => {'subCatogaryNumber': e.subcatogaryNumber, 'name': e.name})
        .toList();
  }
  List<Map<String, dynamic>> getTopicNumber() {
    return allCourse
        .map((e) => {'topicNumber': e.topicNumber, 'name': e.name})
        .toList();
        
  }

}
