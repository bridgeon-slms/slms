class TaskModel {
  final String status;
  final TaskID task;
  final String dueDate;
  final String assignedDate;
  final String submittedDate;
  const TaskModel({
    required this.submittedDate,
    required this.assignedDate,
    required this.dueDate,
    required this.task,
    required this.status,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        submittedDate: json['submittedDate'] ?? 'no data',
        assignedDate: json['assignedDate'] ?? 'no data',
        dueDate: json['dueDate'] ?? 'no date',
        status: json['status'] ?? 'no data',
        task: TaskID.fromJson(json['taskId'] ?? 'null'));
  }
}

class TaskID {
  final String title;
  final String description;
  final String date;
  final int maxMark;
  final int passMark;
  final int difficultyLevel;

  const TaskID(
      {required this.date,
      required this.description,
      required this.title,
      required this.difficultyLevel,
      required this.maxMark,
      required this.passMark});

  factory TaskID.fromJson(Map<String, dynamic> json) {
    return TaskID(
        difficultyLevel: json['difficultyLevel'] ?? 'null',
        maxMark: json['maxMark'] ?? 'no data ',
        passMark: json['passMark'] ?? 'no data',
        date: json['date'] ?? 'no data',
        description: json['description'] ?? 'no data',
        title: json['title'] ?? 'no data');
  }
}
