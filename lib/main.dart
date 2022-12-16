import 'package:flutter/material.dart';
import 'package:todolist/pages/project/todo_project_page.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: TodoProjectPage(),
    );
  }
}
