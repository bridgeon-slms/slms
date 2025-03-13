import 'package:flutter/foundation.dart';

class CourseModel {
  final String name;
  final int duration;
  final String id;

  CourseModel({required this.name, required this.duration, required this.id});

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['courseId']['_id'] ?? '',
      name: json['courseId']['name'] ?? '',
      duration: json['courseId']['duration'] ?? 0,
    );
  }
}

class CartogaryModel {
  final String id;
  final String courseId;
  final String title;

  CartogaryModel({required this.id, required this.title,required this.courseId});

  factory CartogaryModel.fromJson(Map<String, dynamic> json) {
    return CartogaryModel(id: json['_id'], title: json['title'],courseId: json['courseId']['_id']);
  }
}
