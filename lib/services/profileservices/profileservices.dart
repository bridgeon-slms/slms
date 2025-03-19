import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:slms/model/profilemodel/profilemodel.dart';
import 'package:slms/services/dio/dio_services.dart';

class ProfileServices {
  FlutterSecureStorage storage = FlutterSecureStorage();
  


  Future<ProfileModel> getAllProfileDatas() async {
    final userId = await storage.read(key: 'userid');
    log(userId.toString());
      final String profileBaseUrl =
      'https://www.lms-api.bridgeon.in/api/admin/students/profile/$userId';
    final dio = await DioClient.getDioInstance();
    try {
      final response = await dio.get(profileBaseUrl);
      if (response.statusCode == 200) {
        final data = response.data['data'];
        if (data is Map<String, dynamic>) {
          return ProfileModel.fromJson(data);
        } else {
          log('Unexpected response format: Expected Map, got ${data.runtimeType}');
          throw Exception('Invalid profile data format');
        }
      } else {
        log('Failed to fetch data. Status code: ${response.statusCode}');
        throw Exception('Failed to load profile data');
      }
    } on DioException catch (e) {
      log('Dio error: ${e.message}');
      if (e.response != null) {
        log('Response data: ${e.response?.data}');
      }
      throw Exception('Failed to load profile data: ${e.message}');
    } catch (e) {
      log('Unexpected error: $e');
      throw Exception('An error occurred while fetching profile data');
    }
  }
}
