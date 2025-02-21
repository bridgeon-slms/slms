// Model class for the overall response
class NotificationResponse {
  final String status;
  final String message;
  final List<NotificationData> data;

  NotificationResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: (json['data'] as List)
          .map((item) => NotificationData.fromJson(item))
          .toList(),
    );
  }
}

class NotificationData {
  final DateTime date;
  final String message;

  NotificationData({
    required this.date,
    required this.message,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      date: DateTime.parse(json['date'] as String),
      message: json['message'] as String,
    );
  }
}
