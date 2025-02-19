import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:slms/model/dashboard.dart';
import 'package:slms/model/leetcode_model.dart';
import 'package:slms/services/dio/dio_services.dart';
import 'package:slms/utils/api/api.dart';

class HomeServices {
  Future<List<LeaderboardData>> leaderBoardData() async {
    final dio = await DioClient.getDioInstance();
    try {
      final response = await dio.get(ApiUrls.homeScreenUrl);
      if (response.statusCode == 200) {
        List data = response.data['data'];
        return data.map((json) => LeaderboardData.fromJson(json)).toList();
      }
    } on DioException catch (e) {
      log('DioException: ${e.toString()}');
      rethrow;
    } catch (e) {
      log('Error: ${e.toString()}');
      rethrow;
    }
    return [];
  }

  Future<LeetcodeModel> fetchLeetCodeModel() async {
    final dio = await DioClient.getDioInstance();
    try {
      final response =
          await dio.get('https://student.bridgeon.in/api/leetcode/Sinaannnnm');

      if (response.statusCode == 200) {
        log('leetcode called');
        Map<String, dynamic> data = response.data;
        return LeetcodeModel.fromJson(data);
      } else {
        log(response.statusCode.toString() + response.statusMessage.toString());
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
    throw Exception();
  }
}
