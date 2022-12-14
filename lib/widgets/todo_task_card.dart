// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todolist/constants.dart';
import 'package:todolist/models/todo_task.dart';

// Todo 작업 1개를 보여줄 위젯
class TodoTaskCard extends StatefulWidget {
  TodoTaskCard({super.key, required this.task});
  TodoTask task;

  @override
  State<TodoTaskCard> createState() => _TodoTaskCardState();
}

class _TodoTaskCardState extends State<TodoTaskCard> {
  bool testIsCompleted = false;
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.yellow,
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          width: 1.0,
          //TODO 우선순위 구분
          color: Constants.prioriy4Color,
        ),
      ),
      elevation: isHover ? 1.0 : 0.5,
      child: InkWell(
        // https://stackoverflow.com/questions/67994569/flutter-inkwell-why-does-onhover-require-ontap
        // onHover은 단독으로 동작하지 않는다 onTap이 있어야함
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        onTap: () {
          //showDetailTodoTask()
        },
        hoverColor: Colors.transparent,
        splashColor: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: testIsCompleted,
                shape: CircleBorder(
                    side: BorderSide(
                  width: 1.0,
                  //TODO 우선순위 구분
                  color: Constants.prioriy4Color,
                )),
                // onChanged: onPressed
                onChanged: (value) {
                  setState(() {
                    testIsCompleted = !testIsCompleted;
                  });
                },
                // TODO 우선순위 구분
                activeColor: Constants.prioriy4Color,
              ),
              const SizedBox(
                width: 4,
              ),
              Flexible(
                child: Stack(
                  children: [
                    // 설정
                    Visibility(
                      visible: isHover ? true : false,
                      child: Positioned(
                        top: 4,
                        right: 4,
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.more_horiz_outlined,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    // 작업 부분
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.task.title,
                              style: TextStyle(
                                color: !testIsCompleted
                                    ? Colors.black
                                    : Colors.black.withOpacity(0.5),
                                fontSize: 16,
                                decoration: !testIsCompleted
                                    ? null
                                    : TextDecoration.lineThrough,
                              ),
                            ),
                            Text(
                              widget.task.content,
                              style: TextStyle(
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black.withOpacity(0.5)),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
