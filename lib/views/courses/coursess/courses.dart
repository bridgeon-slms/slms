import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/model/profilemodel/profilemodel.dart';
import 'package:slms/view_model/course/course.dart';
import 'package:slms/views/courses/WeekList/weeklist.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  void initState() {
    super.initState();
    context.read<CourseController>().fullAllcourse();
    context.read<CourseController>().getAllCourse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180.0,
            floating: false,
            pinned: true,
            backgroundColor: Colors.indigo,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "All Courses",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.indigoAccent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -30,
                      top: -20,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      left: -40,
                      bottom: -30,
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 60.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Continue your learning journey",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Consumer<CourseController>(
                                builder: (context, controller, _) {
                                  return Text(
                                    "${controller.allCourse.length} Courses Available",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: Consumer<CourseController>(
              builder: (context, controller, _) {
                List<Course> availableCourses = [];
                List<Course> lockedCourses = [];
      
                for (var course in controller.fullcourse) {
                  if (controller.allCourse.any((c) => c.name == course.name)) {
                    availableCourses.add(course);
                  } else {
                    lockedCourses.add(course);
                  }
                }
      
                List<Course> finalCourses = [...availableCourses, ...lockedCourses];
      
                return SliverList(
                  delegate: SliverChildListDelegate([
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        "Available Courses",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: finalCourses.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.85,
                      ),
                      itemBuilder: (context, index) {
                        final course = finalCourses[index];
                        final isAvailable = availableCourses.contains(course);
                        
                        return isAvailable
                            ? _buildAvailableCourseCard(context, course, controller)
                            : _buildLockedCourseCard(course);
                      },
                    ),
                  ]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvailableCourseCard(BuildContext context, Course course, CourseController controller) {
    final Color cardColor = _getRandomColor();
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: cardColor.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            final selectedCourse = controller.allCourse.firstWhere(
              (c) => c.name == course.name,
            );

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WeeklistPage(
                  courseModel: selectedCourse,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 90,
                decoration: BoxDecoration(
                  color: cardColor.withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                alignment: Alignment.center,
                child: Icon(
                  _getCourseIcon(course.name),
                  size: 40,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            "Enrolled",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLockedCourseCard(Course course) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: 0.3,
                    child: Icon(
                      _getCourseIcon(course.name),
                      size: 40,
                      color: Colors.grey[700],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.lock,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Locked",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCourseIcon(String courseName) {
    final Map<String, IconData> courseIcons = {
      "Mathematics": Icons.calculate,
      "Physics": Icons.science,
      "Chemistry": Icons.biotech,
      "Biology": Icons.spa,
      "History": Icons.history_edu,
      "Literature": Icons.book,
      "Computer Science": Icons.computer,
      "Programming": Icons.code,
      "Art": Icons.palette,
      "Music": Icons.music_note,
    };

    // Default icon if course name doesn't match any in the map
    IconData defaultIcon = Icons.school;
    
    // Check if the course name contains any of the keys
    for (var key in courseIcons.keys) {
      if (courseName.toLowerCase().contains(key.toLowerCase())) {
        return courseIcons[key]!;
      }
    }
    
    return defaultIcon;
  }

  Color _getRandomColor() {
    final List<Color> colors = [
      Colors.blue,
      Colors.purple,
      Colors.teal,
      Colors.orange,
      Colors.pink,
      Colors.deepPurple,
      Colors.indigo,
      Colors.cyan,
    ];
    
    // Use the hashCode of the current time to get a "random" index
    int index = DateTime.now().millisecondsSinceEpoch.hashCode % colors.length;
    if (index < 0) index = -index;
    return colors[index];
  }
}