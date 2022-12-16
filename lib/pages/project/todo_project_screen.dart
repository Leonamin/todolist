import 'package:flutter/material.dart';
import 'package:todolist/widgets/todo_section_panel.dart';

class TodoProjectScreen extends StatefulWidget {
  const TodoProjectScreen({super.key});

  @override
  State<TodoProjectScreen> createState() => _TodoProjectScreenState();
}

class _TodoProjectScreenState extends State<TodoProjectScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO 프로젝트 데이터 없으면 가져오는 스크린 있으면 프로젝트
    return Scaffold(
      body: TodoSectionPanel(),
    );
  }
}
