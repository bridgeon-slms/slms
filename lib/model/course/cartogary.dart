class CourseModel {
  final String name;
  final int duration;
  final String id;

  CourseModel({required this.name, required this.duration,required this.id});

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id:json['courseId']['_id'] ?? '' ,
      name: json['courseId']['name'] ?? '',
      duration: json['courseId']['duration'] ?? 0,
    );
  }
}
