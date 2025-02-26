import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:slms/model/dashboard.dart';
import 'package:slms/model/leetcode_model.dart';
import 'package:slms/model/notification.dart';
import 'package:slms/model/payments_model.dart';
import 'package:slms/model/score.dart';
import 'package:slms/services/dio/dio_services.dart';
import 'package:slms/utils/api/api.dart';

class HomeServices {
  FlutterSecureStorage storage = FlutterSecureStorage();
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
      final leetcode = await storage.read(key: 'leetcode');
      if (leetcode != null) {
        final response =
            await dio.get('https://student.bridgeon.in/api/leetcode/$leetcode');

        if (response.statusCode == 200) {
          Map<String, dynamic> data = response.data;
          return LeetcodeModel.fromJson(data);
        } else {
          log(response.statusCode.toString() +
              response.statusMessage.toString());
        }
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
    throw Exception();
  }

  Future<ReviewResponse> getAcadamicScore() async {
    String? userId = await storage.read(key: 'userid');
    final dio = await DioClient.getDioInstance();
    try {
      log(userId.toString());
      final response = await dio.get(
          'https://www.lms-api.bridgeon.in/api/admin/reviews/students/details/$userId?page=0&rowsPerPage=0&scheduled=false');

      if (response.statusCode == 200) {
        final data = response.data;
        return ReviewResponse.fromJson(data);
      }
    } catch (e) {
      throw Exception('error');
    }
    throw Exception('eroor');
  }

  Future<String?> getLeetcodeId() async {
    final dio = await DioClient.getDioInstance();
    String? userId = await storage.read(key: 'userid');
    try {
      final response = await dio.get(
          'https://www.lms-api.bridgeon.in/api/admin/students/profile/$userId');
      if (response.statusCode == 200) {
        final id = response.data['data']['socialLinks']['leetCode'];
        await storage.write(key: 'leetcode', value: id);
        log(id);
        return id;
      }
    } catch (e) {
      throw Exception('erroor');
    }
    return null;
  }

  Future<FeesApiResponse?> fetchFeesData() async {
    final dio = await DioClient.getDioInstance();

    try {
      final response = await dio.get(ApiUrls.paymentsApi);
      if (response.statusCode == 200) {
        return FeesApiResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load fees data');
      }
    } catch (e) {}
  }

  Future<NotificationResponse?> fetchNotification() async {
    String? userId = await storage.read(key: 'userid');
    try {
  final dio = await DioClient.getDioInstance();
  final response = await dio.get(ApiUrls.messagesApi + userId!);
  if (response.statusCode == 200) {
   return NotificationResponse.fromJson(response.data);
  }
} on DioException catch (e) {
    log(e.toString()); 
}
  
  }
}
