import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:slms/model/ReviewModel/review.dart';
import 'package:slms/services/dio/dio_services.dart';

class ReviewServices {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  Future<List<ReviewData>> getAllReviewDatas() async {
    log('Fetching review data...');
    try {
      final userid = await storage.read(key: 'userid');
      if (userid == null) {
        throw Exception("User ID not found in secure storage.");
      }
      var reviewUrl =
          'https://www.lms-api.bridgeon.in/api/admin/reviews/students/details/$userid?page=0&rowsPerPage=0&scheduled=false';

      final dio = await DioClient.getDioInstance();
      final response = await dio.get(reviewUrl);
      if (response.statusCode == 200) {
        List<dynamic> rawData = response.data['data'];
        return rawData.map((e) => ReviewData.fromJson(e)).toList();
      } else {
        throw Exception("Unexpected response format");
      }
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
        throw Exception();
      } else {
      }
      rethrow;
    }
  }

  Future<String?> getReviewDate() async {

    try {
      final userid = await storage.read(key: 'userid');
      var reviewUrl =
          'https://www.lms-api.bridgeon.in/api/admin/reviews/students/details/$userid?page=0&rowsPerPage=0&scheduled=true';
      final dio = await DioClient.getDioInstance();
      final response = await dio.get(reviewUrl);
      if (response.statusCode == 200) {
        final date = response.data['data'][0]['reviewDate'];
        log(date);
        return date;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
