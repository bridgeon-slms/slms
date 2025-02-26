import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:slms/model/profilemodel/profilemodel.dart';
import 'package:slms/services/profileservices/profileservices.dart';

class Profilecontroller extends ChangeNotifier {
  ProfileServices services = ProfileServices();
  List<ProfileModel> profileList = [];

  getAllProfileData() async {
    try {
      final data = await services.getAllProfileDatas();
      profileList = [data];

      log('success to get data from profile api   ${profileList.length}');
      notifyListeners();
    } catch (e) {
      log('error found profile provider or function $e');
      notifyListeners();
    }
  }
}
