import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:slms/services/dio/dio_services.dart';

class ReviewServices {
  FlutterSecureStorage storage = FlutterSecureStorage();
  Future<List<String>?> getReviewCatogary() async {
    final dio = await DioClient.getDioInstance();
    try {
      final response = await dio.get(
          'https://www.lms-api.bridgeon.in/api/admin/enrolled/courses/64be36abb6dfaefb9e580c95/categories');
      if (response.statusCode == 200) {
        List<dynamic> categories = response.data['data']['category'];

        List<String> titles =
            categories.map((category) => category['title'] as String).toList();
  log(titles.toString());
        return titles;
      }
    } on DioException catch (e) {
      log(e.response!.data.toString());
      //  log(e.toString());
    }
    return null;
  }
}
