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
  bool showProjectList = true;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  final headerTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black.withOpacity(0.5));
  final normalTextStyle = TextStyle(fontSize: 18, color: Colors.black);

  _appBar() {
    return AppBar();
  }

  _drawer() {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            onTap: () {},
            // hoverColor: Colors.black.withOpacity(0.2),
            // FIXME 하드코딩 글자
            title: Text(
              "프로젝트",
              style: headerTextStyle,
            ),
            trailing: Wrap(
              spacing: 8.0,
              children: [
                InkWell(onTap: () {}, child: Icon(Icons.add)),
                InkWell(
                    onTap: () {
                      setState(() {
                        showProjectList = !showProjectList;
                      });
                    },
                    child: showProjectList
                        ? Icon(Icons.arrow_drop_down)
                        : Icon(Icons.arrow_left)),
              ],
            ),
          ),
          AnimatedSize(
            duration: Duration(milliseconds: 150),
            curve: Curves.fastOutSlowIn,
            child: Container(
                child: !showProjectList
                    ? null
                    : ListTile(
                        title: Text("ASDASD"),
                      )),
          )
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
      builder: (context, child) => Scaffold(
        appBar: _appBar(),
        drawer: _drawer(),
        body: TodoProjectScreen(),
      ),
    );
  }
}
