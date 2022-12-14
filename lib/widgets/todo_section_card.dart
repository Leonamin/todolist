import 'package:flutter/material.dart';
import 'package:todolist/models/todo_task.dart';
import 'package:todolist/widgets/add_todo_task_card.dart';
import 'package:todolist/widgets/todo_task_card.dart';

class TodoSectionCard extends StatefulWidget {
  const TodoSectionCard({super.key});

  @override
  State<TodoSectionCard> createState() => _TodoSectionCardState();
}

class _TodoSectionCardState extends State<TodoSectionCard> {
  List<TodoTask> taskList = List.generate(
      20,
      (index) => TodoTask(
          id: index,
          projectId: index,
          sectionId: index,
          title: "$index번호 카드",
          content: "내용이 있겠습니까",
          createdAt: DateTime.now().millisecondsSinceEpoch,
          modifiedAt: DateTime.now().millisecondsSinceEpoch,
          deadline: DateTime.now().millisecondsSinceEpoch + 10000,
          isCompleted: false,
          priority: 1,
          alarmList: "",
          taskGroupId: index,
          taskGroupClass: index,
          taskOrder: index));
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TodoTaskCard(
          task: taskList.first,
        ),
        AddTodoTaskCard(),
      ],
    );
  }
}
