import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:slms/model/course/cartogary.dart';
import 'package:slms/view_model/course/course.dart';
import 'package:slms/views/courses/weeksub/weeksub.dart';
import 'package:slms/views/widget/widget.dart';

class WeeklistPage extends StatefulWidget {
  final CourseModel courseModel;

  const WeeklistPage({super.key, required this.courseModel});

  @override
  State<WeeklistPage> createState() => _WeeklistPageState();
}

class _WeeklistPageState extends State<WeeklistPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<CourseController>()
          .getWeekData(courseId: widget.courseModel.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return context.watch<CourseController>().isLodding
        ? loddingWidget()
        : AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
            child: Scaffold(
              backgroundColor: const Color(0xFFF5F7FA),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () => Navigator.pop(context),
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          // ignore: deprecated_member_use
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 10,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child:
                                        const Icon(Icons.arrow_back, size: 22),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              widget.courseModel.name,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1E2B3C),
                              ),
                            ),
                            const SizedBox(height: 6),
                          ],
                        ),
                      ),
                      Consumer<CourseController>(
                        builder: (context, value, child) => Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                // ignore: deprecated_member_use
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Your Progress",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1E2B3C),
                                    ),
                                  ),
                                  Text(
                                    "${(value.weekData.first.catogaryNumber / value.weekData.length * 100).toStringAsFixed(0)}%",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4B7BEC),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: LinearProgressIndicator(
                                  value: value.weekData.first.catogaryNumber /
                                      value.weekData.length,
                                  minHeight: 8,
                                  backgroundColor: const Color(0xFFEDF1F9),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xFF4B7BEC)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      _buildWeeksList(context, screenWidth),
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget _buildWeeksList(BuildContext context, double screenWidth) {
    return Consumer<CourseController>(
      builder: (context, courseController, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 12),
              child: Text(
                "Course Content",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E2B3C),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              itemCount: courseController.weekData.length,
              itemBuilder: (context, index) {
                final course = courseController.weekData[index];
                bool isUnlocked =
                    course.catogaryNumber <= widget.courseModel.catogaryNumber;
                return weekCard(
                    context, course, isUnlocked, index, screenWidth);
              },
            ),
          ],
        );
      },
    );
  }

  Widget weekCard(BuildContext context, CartogaryModel course,
      bool isUnlocked, int index, double screenWidth) {
    final cardHeight = 120.0;

    final color = Colors.blue;

    return Container(
      height: cardHeight,
      margin: const EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            width: screenWidth * 0.82,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: isUnlocked
                      ? () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ModernWeekSubpage(
                                courseModel: widget.courseModel,
                                catogaryId: course.id,
                                courseId: course.courseId,
                                name: course.title,
                              ),
                            ),
                          )
                      : null,
                  child: Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.14),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  course.title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isUnlocked
                                        ? const Color(0xFF1E2B3C)
                                        : Colors.grey.shade400,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  isUnlocked
                                      ? "Week ${index + 1} - Tap to explore"
                                      : "Complete previous weeks first",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isUnlocked
                                        ? const Color(0xFF717F92)
                                        : Colors.grey.shade400,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                if (isUnlocked)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      // ignore: deprecated_member_use
                                      color: color.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "${course.totalSubCAtogary} Lessons",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: color,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        if (isUnlocked)
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: color,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: cardHeight / 2 - 30,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: isUnlocked ? color : Colors.grey.shade300,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: isUnlocked
                        ? color.withOpacity(0.3)
                        : Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: isUnlocked
                    ? Text(
                        "${index + 1}",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 24,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
