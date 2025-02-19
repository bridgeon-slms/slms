class AllScore {
  Academic academic;
  Others others;

  AllScore({required this.academic, required this.others});
  factory AllScore.fromJSon(Map<String, dynamic> json) {
    return AllScore(
        academic: Academic.fromJSon(json['academic']),
        others: Others.fromJson(json['others']));
  }
}

class Academic {
  String? review;
  String? task;
  Academic({required this.review, required this.task});
  factory Academic.fromJSon(Map<String, dynamic> json) {
    return Academic(review: json['review'], task: json['task']);
  }
}

class Others {
  String? discipline;
  String? attentace;
  Others({required this.discipline, required this.attentace});
  factory Others.fromJson(Map<String, dynamic> json) {
    return Others(
        discipline: json['discipline'], attentace: json['attendance']);
  }
}
