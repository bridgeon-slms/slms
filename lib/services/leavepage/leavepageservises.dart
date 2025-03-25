import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:slms/model/leavepagemodel.dart';

class LeavePageServices {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  final String baseUrl =
      "https://www.lms-api.bridgeon.in/api/admin/leaveRequest/student/profile";
  final Dio dio = Dio();

  Future<List<LeavePageModel>> getAllLeaveRequests() async {
    try {
      final response = await dio.get(baseUrl);

      if (response.statusCode == 200) {
        final data = response.data['data'];

        if (data is List) {
          return data.map((item) => LeavePageModel.fromJson(item)).toList();
        } else {
          log('Unexpected response format: expected List, got ${data.runtimeType}');
          throw Exception('Invalid leave page data format');
        }
      } else {
        log('Failed to fetch data. Status code: ${response.statusCode}');
        throw Exception('Failed to load leave page data');
      }
    } on DioException catch (e) {
      log('Dio error: ${e.message}');
      if (e.response != null) {
        log('Response data: ${e.response?.data}');
      }
      throw Exception('Failed to load leave page data: ${e.message}');
    } catch (e) {
      log('Unexpected error: $e');
      throw Exception('An error occurred while fetching leave page data');
    }
  }

  Future<void> addLeavePage(LeavePageModel leavePage) async {
    try {
      await dio.post(baseUrl, data: leavePage.toJson());
    } on DioException catch (e) {
      log('Dio error while adding leave page: ${e.message}');
      throw Exception('Failed to add leave page: ${e.message}');
    } catch (e) {
      log('Unexpected error: $e');
      throw Exception('An error occurred while adding leave page');
    }
  }
}
