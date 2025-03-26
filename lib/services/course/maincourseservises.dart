import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:slms/model/profilemodel/profilemodel.dart';
import 'package:slms/services/dio/dio_services.dart';

class Maincourseservises {
  FlutterSecureStorage storage = FlutterSecureStorage();
  Future<List<Course>> fetchAllCourses() async {
    final dio = await DioClient.getDioInstance();
    try {
      final response = await dio
          .get('https://www.lms-api.bridgeon.in/api/admin/courses/student');
      if (response.statusCode == 200) {
        List<dynamic> categories = response.data['data']['course'];
        return categories.map((json) => Course.fromJson(json)).toList();
      } else {
        throw Exception('failed to load course');
      }
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
