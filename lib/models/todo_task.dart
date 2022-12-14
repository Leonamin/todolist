class TodoTask {
  int id;
  int projectId;
  int sectionId;
  String title;
  String content;
  int createdAt;
  int modifiedAt;
  int deadline;
  bool isCompleted;
  int priority;
  String alarmList;
  int taskGroupId;
  int taskGroupClass;
  int taskOrder;

  TodoTask({
    required this.id,
    required this.projectId,
    required this.sectionId,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.modifiedAt,
    required this.deadline,
    required this.isCompleted,
    required this.priority,
    required this.alarmList,
    required this.taskGroupId,
    required this.taskGroupClass,
    required this.taskOrder,
  });
}
