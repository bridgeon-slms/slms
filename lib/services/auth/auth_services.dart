import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:slms/utils/api/api.dart';

class AuthServices {
  FlutterSecureStorage storage = FlutterSecureStorage();
  Dio dio = Dio();
  void userLogin(String email, String password) async {
    try {
    
      final response = await dio
          .post(ApiUrls.loginUrl, data: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        final accessToken = response.data['data'];
      await storage.write(key: 'token',value: accessToken);

        log(response.data['data'].toString());
      }
    } on DioException catch (e) {
      log(e.message ?? '');
      throw Exception('error');
    }
  }
  
}
