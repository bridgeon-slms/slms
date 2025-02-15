class LeaderBoardModel {
  List<Leaderboard>? leaderboard;

  LeaderBoardModel({this.leaderboard});

  LeaderBoardModel.fromJson(Map<String, dynamic> json) {
    if (json['leaderboard'] != null) {
      leaderboard = <Leaderboard>[];
      json['leaderboard'].forEach((v) {
        leaderboard!.add(Leaderboard.fromJson(v));
      });
    }
  }
}

class Leaderboard {
  String? sId;
  StudentId? studentId;
  int? totalScore;
  bool? isDeleted;

  Leaderboard({
    this.sId,
    this.studentId,
    this.totalScore,
    this.isDeleted,
  });

  Leaderboard.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    studentId = json['studentId'] != null
        ? StudentId.fromJson(json['studentId'])
        : null;
    totalScore = json['totalScore'];
    isDeleted = json['isDeleted'];
  }
}

class StudentId {
  String? sId;
  String? name;
  String? email;
  String? image;

  StudentId({this.sId, this.name, this.email, this.image});

  StudentId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
  }
}
