import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:slms/model/task/task_model.dart';
import 'package:slms/services/task/task_services.dart';

class TaskController extends ChangeNotifier {
  TaskServices taskServices = TaskServices();
  List<TaskModel> taskmodel = [];
  int currentIndex = 0;
  void getAllTask() async {
    try {
      taskmodel = await taskServices.getTask();
      for (var data in taskmodel) {
        log(data.status);
      }
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
  

  void changeIndex(int index){
     currentIndex = index;
     notifyListeners();
  }

}
