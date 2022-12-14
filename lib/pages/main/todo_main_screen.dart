import 'package:flutter/material.dart';
import 'package:todolist/widgets/todo_section_panel.dart';

class TodoMainScreen extends StatefulWidget {
  const TodoMainScreen({super.key});

  @override
  State<TodoMainScreen> createState() => _TodoMainScreenState();
}

class _TodoMainScreenState extends State<TodoMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(title: const Text('Todo'), elevation: 0.0),
      body: TodoSectionPanel(),
    );
  }
}
