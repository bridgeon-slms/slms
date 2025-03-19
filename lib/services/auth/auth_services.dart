import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:slms/utils/api/api.dart';

class AuthServices {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio();

  Future<String> userLogin(String email, String password) async {
    log('Login Attempt: $email');

    try {
      final response = await dio.post(
        ApiUrls.loginUrl,
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      log('Response Status Code: ${response.statusCode}');
      log('Response Data: ${response.data}');

      if (response.statusCode == 200) {
        final accessToken = response.data['data'];
        if (accessToken != null && accessToken.isNotEmpty) {
          log('Access Token: $accessToken');
          
          await storage.write(key: 'token', value: accessToken);
          final user = JwtDecoder.decode(accessToken);
          final userId = user['userId'];
          log('User ID: $userId');
          await storage.write(key: 'userid', value: userId);
          return 'login success';
        } else {
          log("Access token is null or empty!");
          return 'Invalid token received';
        }
      } else {
        log('Invalid email or password');
        return 'Invalid email or password';
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log('Dio Error: ${e.response?.statusCode}');
        log('Error Response: ${e.response?.data}');
      } else {
        log('Dio Error: ${e.message}');
      }
      return 'Login failed';
    }
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
      if (response.statusCode == 200) {
        log(response.data.toString());
        return response.data['message'];
      }
    } on DioException catch (e) {
      return e.response?.data['message'];
    }
    return null;
  }

  Future<String> confirmPAssword(String email,String password)async{
       try {
           final response = await dio.post(ApiUrls.confirmPAssword,data: {
            "email":email,
            "password":password
           });
           if(response.statusCode == 200){
            await userLogin(email, password);
            return response.data['message'];
           }
       }on DioException catch (e) {
         return e.response?.data['message'];
       }
       return 'somthing went wrong';
  }
}
