import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/widgets/todo_tile.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({Key? key}) : super(key: key);
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(title: const Text('Todo'), elevation: 0.0),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Dismissible(
            //WHY 이거 ValueKey<int>(tasks[index].id)를 사용하면 A dismissed Dismissible widget is still part of the tree 에러 발생
            // key: ValueKey<int>(tasks[index].id),
            key: UniqueKey(),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                setState(() {
                  tasks.removeAt(index);
                });
              }
            },
            background: Container(
              color: Colors.red[300],
            ),
            child: TodoTile(
                task: tasks[index],
                onPressed: (value) {
                  setState(() {
                    tasks[index].isCompleted = value!;
                  });
                }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add_task),
        onPressed: () {
          Task newTask = Task(
              id: tasks.isNotEmpty ? tasks.last.id + 1 : 1,
              title: "고래와 테스트 데스!",
              content: "이 내용은 테스트 에여!",
              isCompleted: false,
              order: tasks.isNotEmpty ? tasks.last.order + 1 : 1);
          setState(() {
            tasks.add(newTask);
          });
        },
      ),
    );
  }
}
