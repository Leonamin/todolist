import 'package:flutter/cupertino.dart';
import 'package:todolist/models/todo_project.dart';

class TodoProjectProvider extends ChangeNotifier {
  // UseCase _todoProjectPageUseCase
  List<TodoProjectProvider> todoProjectList = [];

  Future<void> laodProjectList() async {
    // 데이터 가져오기
    //todoProjectList.add(_todoProjectPageUseCase().getAll())
    final temp = [
      TodoProject(
          id: 1,
          name: "개인",
          theme: 0xFFFF0000,
          viewType: ProjectViewType.VerticalSimple,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          modifiedAt: DateTime.now().millisecondsSinceEpoch,
          projectGroupId: 1,
          projectClass: 1,
          projectOrder: 1),
      TodoProject(
          id: 2,
          name: "두번쨰",
          theme: 0xFF00FF00,
          viewType: ProjectViewType.VerticalSpecific,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          modifiedAt: DateTime.now().millisecondsSinceEpoch,
          projectGroupId: 1,
          projectClass: 1,
          projectOrder: 1),
      TodoProject(
          id: 3,
          name: "개인",
          theme: 0xFF00FFF0,
          viewType: ProjectViewType.HorizontalSimple,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          modifiedAt: DateTime.now().millisecondsSinceEpoch,
          projectGroupId: 1,
          projectClass: 1,
          projectOrder: 1),
    ];
  }

  //TODO 추후 원격 서버랑 동기화할 함수임
  Future<void> syncProjectList() async {}
  Future<void> addProject() async {}
  Future<void> deleteProject(int projectId) async {}
  Future<void> modifyProject(int projectId, TodoProject newProject) async {}
  Future<void> getProject(int projectId) async {}
}
