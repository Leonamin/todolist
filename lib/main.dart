import 'package:flutter/material.dart';
import 'package:todolist/pages/main/todo_main_page.dart';
import 'package:todolist/pages/todo_home.dart';

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
      home: TodoMainPage(),
    );
  }
}
