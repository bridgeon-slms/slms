import 'package:flutter/material.dart';

class DateProvider with ChangeNotifier {
  DateTime? startDate;

  DateTime? endDate;

  void setSrartDate(DateTime date) {
    startDate = date;
    notifyListeners();
  }

  void setEsndDate(DateTime date) {
    endDate = date;
    notifyListeners();
  }
}
