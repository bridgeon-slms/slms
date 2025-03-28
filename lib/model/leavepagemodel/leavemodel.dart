class LeaveModel {
  String leaveType;
  String description;
  List<Map<String, dynamic>> dates; // Allow dynamic values in maps

  LeaveModel({
    required this.leaveType,
    required this.description,
    required this.dates,
  });

  Map<String, dynamic> toJson() {
    return {
      'leaveType': leaveType,
      'description': description,
      'dates': dates, // Convert list properly
    };
  }
}
