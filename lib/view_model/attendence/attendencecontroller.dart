import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slms/model/AttendanceModel/AttendanceModels/model.dart';
import 'package:slms/model/AttendanceModel/logModel/logmodel.dart';
import 'package:slms/services/AttendendsServices/attendanceservices.dart';

class Attendencecontroller extends ChangeNotifier {
  Attendanceservices ser = Attendanceservices();
  List<Data> attendenceList = [];
  List<AttendanceLogs> attendenceLogList = [];
  List<Data> getLast = [];

  List first5 = [];
  List last7 = [];
  List last30 = [];


  List<DateTime?> _selectedDates = [];

  List<DateTime?> get selectedDates => _selectedDates;

  void updateDates(List<DateTime?> dates) {
    _selectedDates = dates;
    notifyListeners(); // Notify UI of changes
  }
  getAllDataFromAttendence(from, to) async {
    try {
      attendenceList = await ser.getAllAttendenceDatas(from, to);
      getlast();
      log('succes to get data from attendence api');

      log('length or attendence list is ---${attendenceList.first.date?.length}---');
      notifyListeners();
    } catch (e) {
      log('errro found in attentence provider or functios $e');
    }
  }

  getlast() async {
    try {
      getLast = await ser.getLastDatas();

      log('get last ---${getLast.first.date?.length}---');
      notifyListeners();
    } catch (e) {
      log('errro found in attentence provider  getlast or functios $e');
    }
  }

  last7atasFromTO() {
    last7 = attendenceList.map((e) => e.date).take(7).toList();

    log(' data first ${last7.length.toString()}');
    log('firsttt ${changeDateForListing(last7.last)}');
    notifyListeners();
  }


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

  date() {}

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
    int time = totalTime ~/ 60;
    int minits = totalTime % 60;

    return '${time}H ${minits}M ';
  }

  /// filter functions ....................................................................................................

//last montg sorted

  first5Datas() {
    first5 = attendenceList
        .map((e) => changeDateForListing(e.date))
        .take(5)
        .toList();

    log('  first ${first5.length.toString()}');
    log(first5.toString());
    notifyListeners();
  }

  last7atas() {
    last7 = attendenceList
        .map((e) => changeDateForListing(e.date))
        .take(7)
        .toList();

    log('  first ${first5.length.toString()}');
    log(last7.toString());
    notifyListeners();
  }

  last30Datas() {
    last30 = attendenceList
        .map((e) => changeDateForListing(e.date))
        .take(30)
        .toList();

    log('  first ${first5.length.toString()}');
    log(last30.toString());
    notifyListeners();
  }

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

  lastMonthDatas() {
    DateTime currentDate = DateTime.now();
    DateTime firstOfLastMonth =
        DateTime(currentDate.year, currentDate.month - 1, 1);
    DateTime lastOfLastMonth = DateTime(currentDate.year, currentDate.month, 0);

    var lastMonth = attendenceList
        .where((e) {
          DateTime attendanceDate = DateTime.parse(e.date!);
          return attendanceDate.isAfter(firstOfLastMonth) &&
              attendanceDate.isBefore(lastOfLastMonth.add(Duration(days: 1)));
        })
        .map((e) => changeDateForListing(e.date))
        .toList();

    log('Last month data count: ${lastMonth.length}');
    log(lastMonth.toString());
    notifyListeners();
  }
}
