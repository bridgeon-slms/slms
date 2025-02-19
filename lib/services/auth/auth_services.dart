import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:slms/utils/api/api.dart';

class AuthServices {
  FlutterSecureStorage storage = FlutterSecureStorage();

  Dio dio = Dio();
  Future<String?> userLogin(String email, String password) async {
    log(email);
    try {
      final response = await dio
          .post(ApiUrls.loginUrl, data: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        final accessToken = response.data['data'];
        await storage.write(key: 'token', value: accessToken);
        // jwtDecoder.
        if (accessToken != null) {
          final user = JwtDecoder.decode(accessToken);
          final userId = user['userid'];
          await storage.write(key: 'userid', value: userId);
        }
        return 'login success';
      } else if (response.statusCode == 500) {
        log(response.data);
        final message = response.data;
        log(message.toString());
        return message;
      }
    } on DioException catch (e) {
      log(e.message.toString());
      if (e.type == DioExceptionType.connectionError) {
        log("$e");
      }
    }
    return null;
  }

  Future<String?> verifyEmail(String email) async {
    try {
      final response = await dio.post(ApiUrls.forgotPassWordUrl, data: {
        "email": email,
      });
      if (response.statusCode == 201) {
        log(response.data['message']);
        return response.data['message'];
      } else if (response.statusCode == 404) {
        log(response.data);
      }
    } on DioException catch (e) {
      final data = e.response?.data['message'];
      log(data);
      return data;
    }
    return null;
  }

  Future<String?> verifyOtp(String email, String code) async {
    try {
      final response = await dio.post(ApiUrls.verifyOtp, data: {
        "email": email,
        "code": code,
      });
      if (response.statusCode == 201) {
        log(response.data);
        return response.data['message'];
      } else if (response.statusCode == 404) {
        log(response.data);
        return response.data['message'];
      }
    } catch (e) {}
    return null;
  }
}
