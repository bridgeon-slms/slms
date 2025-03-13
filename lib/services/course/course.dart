import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:slms/model/course/cartogary.dart';
import 'package:slms/model/course/subcatogary.dart';
import 'package:slms/services/dio/dio_services.dart';

class ReviewServices {
  FlutterSecureStorage storage = FlutterSecureStorage();
  Future<List<CartogaryModel>?> getReviewCatogary(String courseId) async {
    final dio = await DioClient.getDioInstance();
    try {
      final response = await dio.get(
          'https://www.lms-api.bridgeon.in/api/admin/enrolled/courses/$courseId/categories');
      if (response.statusCode == 200) {
        List<dynamic> categories = response.data['data']['category'];

        return categories.map((json) => CartogaryModel.fromJson(json)).toList();
      }
    } on DioException catch (e) {
      log(e.response!.data.toString());
      //  log(e.toString());
    }
    return null;
  }

  Future<List<SubCategory>> fetchSubCategories(
      String courseID, String categoryId) async {
    final dio = await DioClient.getDioInstance();
    final String url =
        'https://www.lms-api.bridgeon.in/api/admin/enrolled/courses/$courseID/categories/$categoryId/subcategories';

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        List<dynamic> subcategoriesJson =
            response.data['data']['subcategories'];
        return subcategoriesJson
            .map((json) => SubCategory.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Topic>> fetchTopics(String courseID,String subcategoriesId) async {
    final dio = await DioClient.getDioInstance();
    final String url =
        'https://www.lms-api.bridgeon.in/api/admin/enrolled/courses/$courseID/subcategories/$subcategoriesId/topics';
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        List<dynamic> topicsJson = response.data['data']['topics'];
        log(topicsJson.toString());
        return topicsJson.map((json) => Topic.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<CourseModel>> fetchCourses() async {
    final dio = await DioClient.getDioInstance();
    try {
      final response = await dio
          .get('https://www.lms-api.bridgeon.in/api/admin/enrolled/courses');

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data['data'];

        return jsonData.map((item) => CourseModel.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load courses");
      }
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
