class Task {
  int id;
  String title;
  String? content;
  bool isCompleted;
  int order;

  Task({
    required this.id,
    required this.title,
    this.content,
    required this.isCompleted,
    required this.order,
  });
}
