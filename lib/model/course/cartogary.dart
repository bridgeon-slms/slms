class CourseModel {
  final String name;
  final int duration;
  final String id;
  final String catogaryId;
  final String subcatogaryId;
  final int catogaryNumber;
  final int subcatogaryNumber;
  final int topicNumber;
  final String mainID;

  CourseModel(
      {required this.name,
      required this.mainID,
      required this.topicNumber,
      required this.subcatogaryNumber,
      required this.duration,
      required this.id,
      required this.catogaryId,
      required this.catogaryNumber,
      required this.subcatogaryId});

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      mainID: json['_id'],
      topicNumber: json['onTopic']['topicNumber'] ?? 0,
      subcatogaryNumber: json['onTopic']['subCategoryId']['subCategoryNumber'],
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
  final int totalSubCAtogary;
  CartogaryModel(
      {required this.id,
      required this.title,
      required this.courseId,
      required this.catogaryNumber,
      required this.totalSubCAtogary});

  factory CartogaryModel.fromJson(Map<String, dynamic> json) {
    return CartogaryModel(
        totalSubCAtogary: json['totalSubCategories'] ?? 0,
        catogaryNumber: json['categoryNumber'] ?? 0,
        id: json['_id'] ?? 'null',
        title: json['title'] ?? 'null',
        courseId: json['courseId']['_id'] ?? 'null');
  }
}
