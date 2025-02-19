import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:slms/model/profilemodel/profilemodel.dart';
import 'package:slms/services/dio/dio_services.dart';

class ProfileServices {
  FlutterSecureStorage storage = FlutterSecureStorage();
  final String profileBaseUrl =
      // 'https://www.lms-api.bridgeon.in/api/admin/students/profile/66a763cbe9c9452006a2e776';
      'https://www.lms-api.bridgeon.in/api/admin/students/profile/66447749a62b60d2d9d360ee';

  Future<ProfileModel> getAllProfileDatas() async {
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
