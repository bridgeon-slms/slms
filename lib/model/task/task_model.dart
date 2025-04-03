class TaskModel {
  final String status;
  final TaskID task;
  final String dueDate;
  const TaskModel({
    required this.dueDate,
    required this.task,
    required this.status,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      dueDate: json['dueDate']??'no date',
        status: json['status'] ?? 'no data',
        task: TaskID.fromJson(json['taskId']??'null'));
  }
}

class TaskID {
  final String title;
  final String description;
  final String date;

  const TaskID(
      {required this.date, required this.description, required this.title});

  factory TaskID.fromJson(Map<String, dynamic> json) {
    return TaskID(
        date: json['date'] ?? 'no data',
        description: json['description'] ?? 'no data',
        title: json['title'] ?? 'no data');
  }
}
