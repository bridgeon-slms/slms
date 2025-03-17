class CourseModel {
  final String name;
  final int duration;
  final String id;
  final String catogaryId;
  final String subcatogaryId;
  final int catogaryNumber;
  CourseModel(
      {required this.name,
      required this.duration,
      required this.id,
      required this.catogaryId,
      required this.catogaryNumber,
      required this.subcatogaryId});

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['courseId']['_id'] ?? '',
      name: json['courseId']['name'] ?? '',
      duration: json['courseId']['duration'] ?? 0,
      catogaryId: json['onTopic']['subCategoryId']['categoryId']['_id'],
      catogaryNumber: json['onTopic']['subCategoryId']['categoryId']
          ['categoryNumber'],
      subcatogaryId: json['onTopic']['subCategoryId']['_id'],
    );
  }
}

class CartogaryModel {
  final String id;
  final String courseId;
  final String title;
  final int catogaryNumber;

  CartogaryModel(
      {required this.id, required this.title, required this.courseId,required this.catogaryNumber});

  factory CartogaryModel.fromJson(Map<String, dynamic> json) {
    return CartogaryModel(
      catogaryNumber: json['categoryNumber'],
        id: json['_id'],
        title: json['title'],
        courseId: json['courseId']['_id']);
  }
}
