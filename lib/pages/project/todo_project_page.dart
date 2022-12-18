import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/pages/project/todo_project_screen.dart';
import 'package:todolist/pages/project/providers/todo_project_provider.dart';

class TodoProjectPage extends StatefulWidget {
  const TodoProjectPage({super.key});

  @override
  State<TodoProjectPage> createState() => _TodoProjectPageState();
}

class _TodoProjectPageState extends State<TodoProjectPage>
    with TickerProviderStateMixin {
  // TODO 사용자 설정
  bool _showProjectList = false;

  final headerTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black.withOpacity(0.5));
  final normalTextStyle = TextStyle(fontSize: 18, color: Colors.black);

  _appBar(provider) {
    return AppBar();
  }

  _drawer(TodoProjectProvider provider) {
    return Drawer(
      child: ListView(
        children: [
          ExpansionTile(
            // hoverColor: Colors.black.withOpacity(0.2),
            // FIXME 하드코딩 글자
            title: Text(
              "프로젝트",
              style: headerTextStyle,
            ),
            trailing: Wrap(
              spacing: 8.0,
              children: [
                InkWell(
                    onTap: () {
                      // showProjectCreateDialog
                    },
                    child: const Icon(Icons.add)),
                _showProjectList
                    ? const Icon(Icons.arrow_drop_down)
                    : const Icon(Icons.arrow_left),
              ],
            ),
            children: List<Widget>.generate(
              provider.todoProjectList.length,
              (index) => ListTile(
                onTap: () {
                  // TODO 현재 프로젝트 설정
                  // provider.setCurrentProject()
                },
                title: Text(provider.todoProjectList[index].name),
              ),
            ),
            onExpansionChanged: (bool expanded) {
              setState(() => _showProjectList = expanded);
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final provider = TodoProjectProvider();
        provider.laodProjectList();
        return provider;
      },
      builder: (context, child) => Consumer<TodoProjectProvider>(
        builder: (context, provider, child) => Scaffold(
          appBar: _appBar(provider),
          drawer: _drawer(provider),
          // TODO 중첩 네비게이터
          body: TodoProjectScreen(),
        ),
      ),
    );
  }
}
