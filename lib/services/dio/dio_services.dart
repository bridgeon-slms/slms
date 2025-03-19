import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:slms/utils/api/api.dart';

class DioClient {
  static FlutterSecureStorage storage = FlutterSecureStorage();
  static final Dio dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 15),
      receiveTimeout: Duration(seconds: 15),
    ),
  );
  static Future<Dio> getDioInstance() async {
    dio.interceptors.clear();

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await storage.read(key: 'token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        }
      },
      onError: (error, handler) async {
        final token = await storage.read(key: 'token');
        if (token != null) {
          if (error.response?.statusCode == 403) {
            bool refreshed = await refreshAcessToken();
            if (refreshed) {
              handler.resolve(await _retry(error.requestOptions));
            }
          }
        }
        return handler.next(error);
      },
    ));
    return dio;
  }

  static Future<bool> refreshAcessToken() async {
    log("refresh calling");
    try {
      final response = await dio.post(ApiUrls.refreshTokenUrl,
          options: Options(headers: {
            "Authorization": "Bearer ${await storage.read(key: 'token')}"
          }));
      if (response.statusCode == 200) {
        final newAccessToken = response.data['data'];
        storage.write(key: 'token', value: newAccessToken);
        return true;
      }
    } on DioException catch (e) {
      log(e.toString());
      throw Exception('access tokn errore');
    }
    throw Exception();
  }

  static Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final newAccessToken = await storage.read(key: "token");
    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        "Authorization": "Bearer $newAccessToken",
      },
    );

    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
