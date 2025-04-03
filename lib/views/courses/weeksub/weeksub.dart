import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/model/course/cartogary.dart';
import 'package:slms/view_model/course/course.dart';
import 'package:slms/views/courses/topic_screen.dart';
import 'package:slms/views/widget/widget.dart';

class ModernWeekSubpage extends StatefulWidget {
  final String courseId;
  final String name;
  final String catogaryId;
  final CourseModel courseModel;

  const ModernWeekSubpage({
    super.key,
    required this.courseModel,
    required this.catogaryId,
    required this.courseId,
    required this.name,
  });

  @override
  State<ModernWeekSubpage> createState() => _ModernWeekSubpageState();
}

class _ModernWeekSubpageState extends State<ModernWeekSubpage> {
  @override
  void initState() {
    super.initState();
    context.read<CourseController>().getSubCatogary(
          categoryId: widget.catogaryId,
          courseID: widget.courseId,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textStyled(
          text: widget.name,
          fontSize: 18,
          fontweight: FontWeight.bold,
        ),
        backgroundColor: const Color(0xFFF5F7FA),
      ),
      backgroundColor: const Color(0xFFF5F7FA),
      body: Column(
        children: [
          Expanded(
            child: Consumer<CourseController>(
              builder: (context, value, child) {
                if (value.subcategories.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.menu_book_outlined,
                          size: 80,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'No subcategories available',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  itemCount: value.subcategories.length,
                  itemBuilder: (context, index) {
                    final course = value.subcategories[index];
                    bool isSubcategoryLocked =
                        index >= widget.courseModel.subcatogaryNumber;
                    bool isLastUnlockedSubcategory =
                        index == widget.courseModel.subcatogaryNumber - 1;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                        ),
                        child: ExpansionTile(
                          key: Key(course.id),
                          tilePadding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          shape: const Border(),
                          title: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                    color: Colors.blue.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Text(
                                  course.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (isSubcategoryLocked)
                                Icon(
                                  Icons.lock_rounded,
                                  color: Colors.grey.shade300,
                                ),
                            ],
                          ),
                          onExpansionChanged: isSubcategoryLocked
                              ? null
                              : (isExpanded) {
                                  if (isExpanded) {
                                    context.read<CourseController>().getTopics(
                                          categoryId: course.id,
                                          courseID: widget.courseId,
                                        );
                                  }
                                },
                          children: isSubcategoryLocked
                              ? [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      'Complete previous subcategories to unlock',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ]
                              : value.topicData.isEmpty
                                  ? [
                                      const Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Text(
                                          'No topics available',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                                    ]
                                  : value.topicData
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                      int topicIndex = entry.key;
                                      var topic = entry.value;
                                      bool isTopicLocked =
                                          isLastUnlockedSubcategory &&
                                              (topicIndex >=
                                          
                                                  widget
                                                      .courseModel.topicNumber);

                                      return ListTile(
                                        onTap: isTopicLocked
                                            ? null
                                            : () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        TopicScreen(
                                                      courseModel:
                                                          widget.courseModel,
                                                      topicId: value
                                                          .topicData[index].id,
                                                      topic: topic.title,
                                                      catogaryId: course.id,
                                                      courseId: widget.courseId,
                                                      name: widget.name,
                                                    ),
                                                  ),
                                                ),
                                        leading: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: isTopicLocked
                                                ? Colors.grey.shade300
                                                : Colors.blue.shade50,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Icon(
                                            Icons.check_circle,
                                            color: isTopicLocked
                                                ? Colors.grey
                                                : Colors.blue.shade700,
                                          ),
                                        ),
                                        title: Text(
                                          topic.title,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: isTopicLocked
                                                ? Colors.grey
                                                : Colors.black,
                                          ),
                                        ),
                                        trailing: isTopicLocked
                                            ? Icon(
                                                Icons.lock,
                                                color: Colors.grey.shade300,
                                              )
                                            : null,
                                      );
                                    }).toList(),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
