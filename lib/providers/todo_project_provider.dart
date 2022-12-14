import 'package:flutter/cupertino.dart';
import 'package:todolist/models/todo_project.dart';

class TodoProjectProvider extends ChangeNotifier {
  List<TodoProjectProvider> todoProjectList = [];

  //TODO 추후 원격 서버랑 동기화할 함수임
  Future<void> syncProjectList() async {}
  Future<void> addProject() async {}
  Future<void> deleteProject(int projectId) async {}
  Future<void> modifyProject(int projectId, TodoProject newProject) async {}
  Future<void> getProject(int projectId) async {}
}
