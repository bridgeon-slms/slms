import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:slms/model/AttendanceModel/AttendanceModels/model.dart';
import 'package:slms/model/AttendanceModel/logModel/logmodel.dart';

class Attendanceservices {
  Dio dio = Dio();
  var token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjU1ZDQzNTFhMzdlN2EwMzBkOTMxMmIiLCJpYXQiOjE3Mzk4MDAwNjgsImV4cCI6MTczOTgwMzY2OH0.qRCajP1-XnaM2X2aM_3w7bB8xfrODHppTPJ2yujMBME';
  final attndenceBaseUrl =
      'https://www.lms-api.bridgeon.in/api/admin/attendance/students/6655d4351a37e7a030d9312b/profile?fromDate=2025-02-09T08:34:07.154Z&toDate=2025-02-15T08:34:07.154Z';

  Future<List<Data>> getAllAttendenceDatas() async {
    try {
      final response = await dio.get(attndenceBaseUrl,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          }));

      if (response.statusCode == 200) {
        List<dynamic> data = await response.data['data'];
        log(response.data['message']);
        return data.map((e) => Data.fromJson(e)).toList();
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

  // attendents log api services

  final logUrl =
      'https://www.lms-api.bridgeon.in/api/admin/attendanceLog/student/profile';

  Future<List<AttendanceLogs>> attendentanceLog() async {
    try {
      final response = await dio.get(logUrl,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          }));

      if (response.statusCode == 200) {
        log('succes to fetch items from attendence log ${response.data['message']}');
        List<dynamic> data = response.data['data']['attendanceLogs'];
        // log(response.data.toString());
        return data.map((e) => AttendanceLogs.fromJson(e)).toList();
      }
    } catch (e) {
      if (e is DioException) {
        log('${e.message} ${e.response?.data}');
        throw Exception(e);
      } else {
        log('error found $e');
      }
    }
    return [];
  }
}
