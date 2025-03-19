
class ReviewResponse {
  final String status;
  final String message;
  final List<ReviewData> data;

  ReviewResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ReviewResponse.fromJson(Map<String, dynamic> json) {
    return ReviewResponse(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: (json['data'] as List).map((e) => ReviewData.fromJson(e)).toList(),
    );
  }
}

class ReviewData {
  final Academic academic;
  final Others others;

  ReviewData({
    required this.academic,
    required this.others,
  });

  factory ReviewData.fromJson(Map<String, dynamic> json) {
    return ReviewData(
      academic: Academic.fromJson(json['academic']),
      others: Others.fromJson(json['others']),
    );
  }
}

class Academic {
  final double review;
  final double task;

  Academic({
    required this.review,
    required this.task,
  });

  factory Academic.fromJson(Map<String, dynamic> json) {
    return Academic(
      review: double.parse(json['review'].toString()),
      task: double.parse(json['task'].toString()),
    );
  }
}

class Others {
  final double attendance;
  final double discipline;

  Others({
    required this.attendance,
    required this.discipline,
  });

  factory Others.fromJson(Map<String, dynamic> json) {
    return Others(
      attendance: double.parse(json['attendance'].toString()),
      discipline: double.parse(json['discipline'].toString()),
    );
  }
}