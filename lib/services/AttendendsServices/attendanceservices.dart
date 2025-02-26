import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:slms/model/AttendanceModel/AttendanceModels/model.dart';
import 'package:slms/model/AttendanceModel/logModel/logmodel.dart';
import 'package:slms/services/dio/dio_services.dart';

class Attendanceservices {
  Future<List<Data>> getAllAttendenceDatas(from, to) async {
    var attndenceBaseUrl =
        'https://www.lms-api.bridgeon.in/api/admin/attendance/students/6655d4351a37e7a030d9312b/profile?fromDate=$from&toDate=$to';
    final dio = await DioClient.getDioInstance();
    try {
      final response = await dio.get(
        attndenceBaseUrl,
      );

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
    final dio = await DioClient.getDioInstance();
    try {
      final response = await dio.get(
        logUrl,
      );

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


  Future<List<Data>> getLastDatas() async {
    var attndenceBaseUrl =
        'https://www.lms-api.bridgeon.in/api/admin/attendance/students/6655d4351a37e7a030d9312b/profile?fromDate=';
    final dio = await DioClient.getDioInstance();
    try {
      final response = await dio.get(
        attndenceBaseUrl,
      );

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
}