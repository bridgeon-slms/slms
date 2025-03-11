class SubCategory {
  final String id;
  final String title;

  SubCategory({required this.id, required this.title});

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
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
