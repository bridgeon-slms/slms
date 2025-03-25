class SubCategory {
  final String id;
  final String title;
  final String courseId;
  final int catogaryNumber;

  SubCategory({required this.id, required this.title, required this.courseId,required this.catogaryNumber});

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      catogaryNumber: json['categoryNumber']??0,
      courseId: json['categoryId']['_id'],
      id: json['_id'],
      title: json['title'].trim(),
    );
  }
}

class Topic {
  final String title;
  final String description;
  final int topicNumber;
  final String id;

  Topic({required this.title, required this.description,required this.topicNumber,required this.id});

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      id: json['_id'],
      topicNumber: json['topicNumber'],
      title: json['title']??'null',
      description: json['description']??'null',
    );
  }
}
