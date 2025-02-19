class LeetcodeModel {
  String? message;
  Data data;
  LeetcodeModel({required this.message, required this.data});
  factory LeetcodeModel.fromJson(Map<String, dynamic> json) {
    return LeetcodeModel(
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  List<AcSubmissionNum> acSubmissionNum;
  Data({required this.acSubmissionNum});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      acSubmissionNum: List<AcSubmissionNum>.from(
          json["acSubmissionNum"].map((x) => AcSubmissionNum.fromJson(x))),
    );
  }
}

class AcSubmissionNum {
  String? difficulty;
  int? count;
  int? submissions;
  AcSubmissionNum({
    required this.count,
    required this.difficulty,
    required this.submissions,
  });
  factory AcSubmissionNum.fromJson(Map<String, dynamic> json) {
    return AcSubmissionNum(
      count: json['count'],
      difficulty: json['difficulty'],
      submissions: json['submissions'],
    );
  }
}