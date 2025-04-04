import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/helpers/helpers.dart';
import 'package:slms/model/task/task_model.dart';
import 'package:slms/view_model/task/task_controller.dart';
import 'package:slms/views/task/task_widgets.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TaskController>().getAllTask();
  }

  final PageController _pageController = PageController(viewportFraction: 0.85);

  final List<Map<String, dynamic>> _categories = [
    {
      "title": "Pending Tasks",
      "color": const Color(0xFFF27A54),
      "iconData": Icons.hourglass_empty,
      "status": "pending"
    },
    {
      "title": "In Progress",
      "color": const Color(0xFF6C6CE5),
      "iconData": Icons.sync,
      "status": "progress"
    },
    {
      "title": "Re-review",
      "color": const Color(0xFF6C6CE5),
      "iconData": Icons.sync,
      "status": "re-review"
    },
    {
      "title": "Submitted",
      "color": const Color(0xFF6C6CE5),
      "iconData": Icons.sync,
      "status": "submitted"
    },
    {
      "title": "Completed",
      "color": const Color(0xFF49C496),
      "iconData": Icons.check_circle,
      "status": "completed"
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("Total Categories: ${_categories.length}");
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tasks',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[800],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Page View
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  context.read<TaskController>().changeIndex(index);
                },
                itemCount: _categories.length,
                itemBuilder: (context, categoryIndex) {
                  return Consumer<TaskController>(
                    builder: (context, taskController, child) {
                      List<TaskModel> filteredTasks = taskController.taskmodel
                          .where((task) =>
                              task.status ==
                              _categories[categoryIndex]["status"])
                          .toList();

                      return _buildCategoryPage(
                        categoryTitle: _categories[categoryIndex]["title"],
                        categoryColor: _categories[categoryIndex]["color"],
                        categoryIcon: _categories[categoryIndex]["iconData"],
                        tasks: filteredTasks,
                        status: _categories[categoryIndex]["status"],
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Page Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _categories.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: context.read<TaskController>().currentIndex == index
                      ? 24
                      : 8,
                  decoration: BoxDecoration(
                    color: context.watch<TaskController>().currentIndex == index
                        ? Colors.blueGrey
                        // ignore: deprecated_member_use
                        : Colors.blueGrey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryPage({
    required String categoryTitle,
    required Color categoryColor,
    required IconData categoryIcon,
    required List<TaskModel> tasks,
    required String status,
  }) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: categoryColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: categoryColor.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  categoryIcon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoryTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${tasks.length} tasks",
                    style: TextStyle(
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Task List
        Expanded(
          child: tasks.isEmpty
              ? Center(
                  child: Text(
                    "No tasks available",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: taskConatiner(
                        submittedDate: task.submittedDate,
                        model: task,
                        context: context,
                        status: task.status,
                        date: formatDate(DateTime.parse(task.dueDate)),
                        decs: task.task.description,
                        title: task.task.title,
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
