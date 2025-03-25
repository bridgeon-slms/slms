import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:slms/model/leavepagemodel.dart';
import 'package:slms/services/leavepage/leavepageservises.dart';

class LeavePageController extends ChangeNotifier {
  final LeavePageServices _services = LeavePageServices();
  List<LeavePageModel> leaveList = [];
  bool isLoading = false;

  Future<void> getAllProfileData() async {
    isLoading = true;
    notifyListeners();
    try {
      leaveList = await _services.getAllLeaveRequests();
      log('Successfully fetched leave data: ${leaveList.length} items');
    } catch (e) {
      log('Error fetching leave data: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addLeave(LeavePageModel leaveRequest) async {
    isLoading = true;
    notifyListeners();
    try {
      await _services.addLeavePage(leaveRequest);
      log('Leave request added successfully');

      await getAllProfileData();
    } catch (e) {
      log('Error adding leave request: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
