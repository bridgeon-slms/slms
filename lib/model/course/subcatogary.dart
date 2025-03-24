class SubCategory {
  final String id;
  final String title;
  final String courseId;
  final int totalTopics;
  final int catogaryNumber;
  final bool isUnlocked; // ✅ Add this field

  SubCategory({
    required this.id,
    required this.title,
    required this.courseId,
    required this.catogaryNumber,
    required this.totalTopics,
    required this.isUnlocked, // ✅ Include in constructor
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      catogaryNumber: json['categoryNumber'] ?? 0,
      totalTopics: json['totalTopics'] ?? 0,
      courseId: json['categoryId']['_id'] ?? "",
      id: json['_id'] ?? "",
      title: json['title'].trim() ?? "",
      isUnlocked:
          json['isUnlocked'] ?? false, // ✅ Fetch from API or default to false
    );
  }
}
