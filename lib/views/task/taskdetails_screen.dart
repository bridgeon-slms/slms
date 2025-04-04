import 'package:flutter/material.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as htmlDom;

import 'package:slms/helpers/helpers.dart';
import 'package:slms/model/task/task_model.dart';
import 'package:slms/views/auth/widget/login_widget.dart';

class TaskDetailsScreen extends StatelessWidget {
 final TaskModel taskModel;
  const TaskDetailsScreen({super.key,required this.taskModel});

  @override
  Widget build(BuildContext context) {
htmlDom.Document decs = htmlParser.parse(taskModel.task.description);


    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7FA),
        elevation: 0,
        title:  Text(
          taskModel.task.title,
          style: TextStyle(
            color: Color(0xFF2A2D34),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status card
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF4E5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:  Text(
                       taskModel.status,
                        style: TextStyle(
                          color: Color(0xFFFF9800),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Due Date',
                          style: TextStyle(
                            color: Color(0xFF2A2D34),
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                         formatDate(DateTime.parse(taskModel.dueDate)),
                          style: TextStyle(
                            color: Color(0xFF2A2D34),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Task info section
              const Text(
                'Task Info',
                style: TextStyle(
                  color: Color(0xFF2A2D34),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
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
                  children: [
                    _buildInfoRow('Category', 'Flutter', Icons.category),
                    const Divider(height: 1),
                    _buildInfoRow('Difficulty', taskModel.task.difficultyLevel.toString(), Icons.signal_cellular_alt),
                    const Divider(height: 1),
                    _buildInfoRow('Max Score', '${taskModel.task.maxMark} points', Icons.star),
                    const Divider(height: 1),
                    _buildInfoRow('Pass Mark', '${taskModel.task.passMark} points', Icons.check_circle),
                
                    const Divider(height: 1),
                    _buildInfoRow('Assigned Date', formatDate(DateTime.parse(taskModel.assignedDate)), Icons.calendar_today),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Description section
              const Text(
                'Description',
                style: TextStyle(
                  color: Color(0xFF2A2D34),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child:  Text(
                    decs.body?.text??''
               ,
                  style: TextStyle(
                    color: Color(0xFF2A2D34),
                    height: 1.5,
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Submission section
              const Text(
                'Task Submission',
                style: TextStyle(
                  color: Color(0xFF2A2D34),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
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
                    const Text(
                      'Add Project Repository Link',
                      style: TextStyle(
                        color: Color(0xFF2A2D34),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'github repo ',
                        fillColor: const Color(0xFFF5F7FA),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(
                          Icons.link,
                          color: Color(0xFF2A2D34),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    

                    Center(
                      child: SizedBox(
                        height: 50,
                        child: containerBtn(context: context,text: 'SUBMIT')),
                    )
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            // ignore: deprecated_member_use
            color: const Color(0xFF2A2D34).withOpacity(0.7),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              // ignore: deprecated_member_use
              color: const Color(0xFF2A2D34).withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF2A2D34),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}