class SubCategory {
  final String id;
  final String title;
  final String courseId;

  SubCategory({required this.id, required this.title,required this.courseId});

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
courseId: json['categoryId']['_id'],
      id: json['_id'],
      title: json['title'].trim(),
    );
  }
}



class Topic {
  final String title;
  final String description;

  Topic({required this.title, required this.description});

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      title: json['title'].trim(),
      description: json['description'].trim(),
    );
  }
}
