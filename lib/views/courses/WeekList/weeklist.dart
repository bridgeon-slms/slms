import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/model/course/cartogary.dart';
import 'package:slms/view_model/course/course.dart';
import 'package:slms/views/courses/weeksub/weeksub.dart';
import 'package:slms/views/widget/widget.dart';

// ignore: must_be_immutable
class WeeklistPage extends StatelessWidget {
  CourseModel courseModel;

  WeeklistPage({super.key, required this.courseModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AppBar(
            title: Text(courseModel.name),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FutureBuilder(
                future: context
                    .read<CourseController>()
                    .getWeekData(courseId: courseModel.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  }

                  if (!snapshot.hasData || snapshot.data?.isEmpty == true) {
                    return const Center(child: Text("No weeks available."));
                  }

                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final course = snapshot.data?[index];
                      bool isUnlocked = course?.catogaryNumber != null &&
                          course!.catogaryNumber <= courseModel.catogaryNumber;

                      return isUnlocked
                          ? ListTile(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WeekSubPage(
                                    categoryId: course.courseId,
                                    courseId: course.courseId,
                                    name: course.title,
                                    topic: course.id,
                                    categoryNumber: course.catogaryNumber,
                                    catogaryId: course.courseId,
                                  ),
                                ),
                              ),
                              title: SizedBox(
                                height: 100,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: const Color.fromARGB(
                                          255, 194, 242, 196),
                                      radius: 30,
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Center(
                                        child: textStyled(
                                            text: course.title,
                                            fontweight: FontWeight.bold)),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            )
                          : ListTile(
                              title: SizedBox(
                                height: 100,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.grey[200],
                                      radius: 30,
                                      child: Icon(
                                        Icons.lock,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Center(
                                        child: textStyled(
                                            text: course?.title ?? '',
                                            color: Colors.grey)),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                            );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
