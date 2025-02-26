import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:slms/services/dio/dio_services.dart';
import 'package:slms/utils/api/api.dart';

class ReviewServices {
  FlutterSecureStorage storage = FlutterSecureStorage();
  void getReviewCatogary() async {
    final dio = await DioClient.getDioInstance();
    final userid = await storage.read(key: 'userid');
   try {

       final response = await  dio.get('${ApiUrls.courseApi}/$userid/categories/');
     if(response.statusCode == 200){
      log(response.data);
     }
   } on DioException catch (e) {
    log(e.response?.data);
    //  log(e.toString());
   }
  }
}
