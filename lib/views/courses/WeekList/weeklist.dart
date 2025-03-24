import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/model/course/cartogary.dart';
import 'package:slms/view_model/course/course.dart';
import 'package:slms/views/courses/weeksub/weeksub.dart';

class WeeklistPage extends StatelessWidget {
  final CourseModel courseModel;

  const WeeklistPage({super.key, required this.courseModel});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            _buildProgressBar(context),
            Expanded(
              child: _buildWeeksList(context, screenWidth),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
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
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.arrow_back, size: 22),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(Icons.more_vert, size: 22),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            courseModel.name,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E2B3C),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(
                Icons.calendar_today,
                size: 14,
                color: Color(0xFF717F92),
              ),
              const SizedBox(width: 6),
              Text(
                "${DateTime.now().year} • ${courseModel.catogaryNumber} weeks",
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF717F92),
                ),
              ),
              const SizedBox(width: 20),
              const Icon(
                Icons.person_outline,
                size: 14,
                color: Color(0xFF717F92),
              ),
              const SizedBox(width: 6),
              const Text(
                "Your instructor",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF717F92),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                "50%",
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
              value: 0.5,
              minHeight: 8,
              backgroundColor: const Color(0xFFEDF1F9),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4B7BEC)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeeksList(BuildContext context, double screenWidth) {
    return FutureBuilder(
      future: context
          .read<CourseController>()
          .getWeekData(courseId: courseModel.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4B7BEC)),
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/error.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 16),
                Text(
                  "Oops! Something went wrong",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Please try again later",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data?.isEmpty == true) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  size: 64,
                  color: Color(0xFFEAB308),
                ),
                SizedBox(height: 16),
                Text(
                  "No weeks available",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E2B3C),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Check back later for course content",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF717F92),
                  ),
                ),
              ],
            ),
          );
        }

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
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final course = snapshot.data![index];
                  bool isUnlocked = course.catogaryNumber != null &&
                      course.catogaryNumber <= courseModel.catogaryNumber;

                  return _buildWeekCard(
                      context, course, isUnlocked, index, screenWidth);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildWeekCard(BuildContext context, dynamic course, bool isUnlocked,
      int index, double screenWidth) {
    final cardHeight = 120.0;
    final colors = [
      const Color(0xFF4B7BEC),
      const Color(0xFFF1556C),
      const Color(0xFF45CE8C),
      const Color(0xFFFF905A),
      const Color(0xFF7B68EE),
    ];

    final color = colors[index % colors.length];

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
                  // onTap: isUnlocked
                  //     ? () => Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => WeekSubPage(
                  //               catogaryId: course.id,
                  //               courseId: course.courseId,
                  //               name: course.title,
                  //             ),
                  //           ),
                  //         )
                  //     : null,
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
                                      color: color.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "4 Lessons",
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
