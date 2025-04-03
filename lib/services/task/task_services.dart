import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:slms/model/task/task_model.dart';
import 'package:slms/services/dio/dio_services.dart';
import 'package:slms/utils/api/api.dart';

class TaskServices {
  Future<List<TaskModel>> getTask() async {
    final dio = await DioClient.getDioInstance();
    try {
      final response = await dio.get(ApiUrls.taskApi);
      if (response.statusCode == 200) {
        final List data = response.data['data']['data'];
    
        return data.map((json) => TaskModel.fromJson(json)).toList();
      }
    } on DioException catch (e) {
      log(e.toString());
    }
    return [];
  }
}
