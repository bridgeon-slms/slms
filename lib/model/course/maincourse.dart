class Course {
  String? id;
  String? name;
  String? description;

  Course({required this.id, required this.name, required this.description});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
        id: json['id'], name: json['name'], description: json['description']);
  }
}
