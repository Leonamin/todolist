import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class TodoTile extends StatefulWidget {
  TodoTile({Key? key, required this.task, this.onPressed, this.onTap})
      : super(key: key);
  // 나중에 여기에 content의 내용 및 해결된 상태 추가
  Task task;
  Function(bool?)? onPressed;
  Function()? onTap;
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Stack(
            children: [
              // AnimatedContainer(
              //   duration: const Duration(milliseconds: 100),
              //   height: isSelected ? 300 : 0,
              //   padding: const EdgeInsets.all(24),
              //   decoration: BoxDecoration(
              //       color: Colors.blue[300],
              //       borderRadius: BorderRadius.only(
              //           bottomLeft: Radius.circular(12),
              //           bottomRight: Radius.circular(12))),
              //   child: isSelected
              //       ? Row(
              //           children: [
              //             Text(widget.task.content ?? "",
              //                 style: TextStyle(
              //                     decoration: widget.task.isCompleted
              //                         ? TextDecoration.lineThrough
              //                         : null)),
              //           ],
              //         )
              //       : null,
              // ),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        value: widget.task.isCompleted,
                        onChanged: widget.onPressed,
                      ),
                      Text(widget.task.title,
                          style: TextStyle(
                              decoration: widget.task.isCompleted
                                  ? TextDecoration.lineThrough
                                  : null)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            height: isSelected ? 300 : 0,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: Colors.yellow[300],
                borderRadius: BorderRadius.circular(24)),
            child: isSelected
                ? Row(
                    children: [
                      Text(widget.task.content ?? "",
                          style: TextStyle(
                              decoration: widget.task.isCompleted
                                  ? TextDecoration.lineThrough
                                  : null)),
                    ],
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
