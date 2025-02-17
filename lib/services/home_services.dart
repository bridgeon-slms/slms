import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:slms/model/dashboard.dart';
import 'package:slms/services/dio/dio_services.dart';
import 'package:slms/utils/api/api.dart';

class HomeServices {
  


  Future<List<LeaderBoardModel>> leaderBoardData()async{
      final dio =await  DioClient.getDioInstance();
    try {
      final response = await dio.get(ApiUrls.homeScreenUrl);
      if(response.statusCode == 200){
        log(response.data['data']['leaderboard'].toString());
      }
    }on DioException catch(e) {
      log(e.toString());
    }
    throw Exception();
  }
}