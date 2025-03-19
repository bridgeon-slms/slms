
class LeaderboardResponse {
  String status;
  String message;
  List<LeaderboardData> leaderboardData;

  LeaderboardResponse({
    required this.status,
    required this.message,
    required this.leaderboardData,
  });

  factory LeaderboardResponse.fromJson(Map<String, dynamic> json) {
    return LeaderboardResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      leaderboardData: (json['data'] as List)
          .map((item) => LeaderboardData.fromJson(item))
          .toList(),
    );
  }
}

class LeaderboardData {
  String? id;
  StudentId? studentId;
  int? totalScore;
  bool? isDeleted;
  String? createdDate;
  String? updatedDate;
  int? version;

  LeaderboardData({
    this.id,
    this.studentId,
    this.totalScore,
    this.isDeleted,
    this.createdDate,
    this.updatedDate,
    this.version,
  });

  factory LeaderboardData.fromJson(Map<String, dynamic> json) {
    return LeaderboardData(
      id: json['_id'] as String?,
      studentId: json['studentId'] != null ? StudentId.fromJson(json['studentId']) : null,
      totalScore: json['totalScore'] as int?,
      isDeleted: json['isDeleted'] as bool?,
      createdDate: json['createdDate'] as String?,
      updatedDate: json['updatedDate'] as String?,
      version: json['__v'] as int?,
    );
  }
}

class StudentId {
  String? id;
  String? name;
  String? email;
  String? image;

  StudentId({
    this.id,
    this.name,
    this.email,
    this.image,
  });

  factory StudentId.fromJson(Map<String, dynamic> json) {
    return StudentId(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
    );
  }
}