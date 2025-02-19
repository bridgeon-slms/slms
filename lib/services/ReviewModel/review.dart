import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:slms/model/ReviewModel/review.dart';
import 'package:slms/services/dio/dio_services.dart';

class ReviewServices {
  Future<List<ReviewData>> getAllReviewDatas() async {
    var attndenceBaseUrl =
        'https://www.lms-api.bridgeon.in/api/admin/reviews/students/details/6655d4351a37e7a030d9312b?page=0&rowsPerPage=0&scheduled=false';
    final dio = await DioClient.getDioInstance();
    try {
      final response = await dio.get(
        attndenceBaseUrl,
      );

      if (response.statusCode == 200) {
        List<dynamic> data = await response.data['data'];
        log(response.data['message']);
        log(data.toString());
        return data.map((e) => ReviewData.fromJson(e)).toList();
      } else {
        log('error found to fetch data');
      }
    } catch (e) {
      if (e is DioException) {
        log('${e.message} ${e.response?.data}');
        throw Exception(e);
      }
    }
    return [];
  }
}
