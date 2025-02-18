import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slms/AttendanceModel/AttendanceModels/model.dart';
import 'package:slms/AttendanceModel/logModel/logmodel.dart';
import 'package:slms/AttendendsServices/attendanceservices.dart';
import 'package:slms/views/%20AttendancePage/%20AttendanceMain/widgets.dart';

class Attendencecontroller extends ChangeNotifier {
  Attendanceservices ser = Attendanceservices();
  List<Data> attendenceList = [];
  List<AttendanceLogs> attendenceLogList = [];

// for getting the datas form the api of attendence and adding to list

  getAllDataFromAttendence() async {
    try {
      attendenceList = await ser.getAllAttendenceDatas();
      log('succes to get data from attendence api');
      log('length or attendence list is ---${attendenceList.length}---');
      notifyListeners();
    } catch (e) {
      log('errro found in attentence provider or functios $e');
    }
  }

  /// date piker

  DateTime selectedDate = DateTime.now();

  void setDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

// Date changing funtionsss ..............................

// for getting the datas form the api of attendence and adding to list

  getAllDataFromAttendenceLog() async {
    try {
      attendenceLogList = await ser.attendentanceLog();
      log('succes to get data form attetends log   leangth of the list --${attendenceLogList.length}--');
      notifyListeners();
    } catch (e) {
      log('error found in attendtense log $e');
    }
  }

  // it is used to change the gmd date to normal indian date for listing the attendence builder
  changeDateForListing(cheackinDate) {
    DateTime newCheckInTime = DateTime.parse(cheackinDate).toUtc();
    DateTime addedTime = newCheckInTime.add(Duration(hours: 5, minutes: 30));
    var inDate = DateFormat('dd-MM-yyyy').format(addedTime);
    return inDate;
  }

// to cheack or get the cheack in date for the bottomsheet
  String cheackinTake(cheackinDate) {
    DateTime newCheckInTime = DateTime.parse(cheackinDate).toUtc();
    DateTime addedTime = newCheckInTime.add(Duration(hours: 5, minutes: 30));
    var inDate = DateFormat.jm().format(addedTime);
    // notifyListeners();
    return inDate;
  }

// to cheack or get the cheack Out in date for the bottomsheet
  String cheackOut(cheackinDate) {
    DateTime newCheckInTime = DateTime.parse(cheackinDate).toUtc();
    DateTime addedTime = newCheckInTime.add(Duration(hours: 5, minutes: 30));
    var inDate = DateFormat.jm().format(addedTime);

    return inDate;
  }

// totel worktime in   hour & seconds
  String workTimeTotelInHour(totalTime) {
    int totelWorkTime = 555;
    int time = totalTime ~/ 60;
    int minits = totalTime % 60;

    return '${time}H ${minits}M ';
  }

  /// filter functions ....................................................................................................

//last montg sorted
  completeDate() {
    var a = attendenceLogList.map((e) => e.createdAt).toList();
    var adds = [];

    for (var i in a) {
      adds.add(changeDateForListing(i));
    }

    Set dob = adds.toSet();

    log(dob.toString());
  }

  //first 7 days
  void last7Days() {
    var a = attendenceLogList.map((e) => e.createdAt).toList();
    var adds = [];

    for (var i in a) {
      adds.add(changeDateForListing(i));
    }
    List dob = adds.toSet().toList();

    List last7 = [];

    for (int i = 0; i < dob.length; i++) {
      last7.add(dob[i]);
      if (i == 7) {
        break;
      }
    }

    log(last7.toString());
  }

  void last30Days() {
    var a = attendenceLogList.map((e) => e.createdAt).toList();
    var adds = [];

    for (var i in a) {
      adds.add(changeDateForListing(i));
    }
    List dob = adds.toSet().toList();

    List last30 = [];

    for (int i = 0; i < dob.length; i++) {
      last30.add(dob[i]);
      if (i == 29) {
        break;
      }
    }

    log(last30.length.toString());
  }
}
