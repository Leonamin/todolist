import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/pages/main/todo_main_screen.dart';
import 'package:todolist/providers/todo_project_provider.dart';

class TodoMainPage extends StatefulWidget {
  const TodoMainPage({super.key});

  @override
  State<TodoMainPage> createState() => _TodoMainPageState();
}

class _TodoMainPageState extends State<TodoMainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final provider = TodoProjectProvider();
        // provider.init()
        return provider;
      },
      builder: (context, child) => TodoMainScreen(),
    );
  }
}
