import 'package:flutter/material.dart';
import 'package:todolist/widgets/todo_section_card.dart';

class TodoSectionPanel extends StatefulWidget {
  const TodoSectionPanel({super.key});

  @override
  State<TodoSectionPanel> createState() => _TodoSectionPanelState();
}

class _TodoSectionPanelState extends State<TodoSectionPanel> {
  @override
  Widget build(BuildContext context) {
    return TodoSectionCard();
  }
}
