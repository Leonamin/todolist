import 'package:flutter/material.dart';
import 'package:todolist/constants.dart';

class AddTodoTaskCard extends StatefulWidget {
  const AddTodoTaskCard({super.key});

  @override
  State<AddTodoTaskCard> createState() => _AddTodoTaskCardState();
}

class _AddTodoTaskCardState extends State<AddTodoTaskCard> {
  bool isWriteMode = false;
  bool isHover = false;
  bool isActive = false;

  _addTaskCard() {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: InkWell(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            isWriteMode = true;
          });
        },
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 13,
                  backgroundColor:
                      isHover ? Constants.positiveColor : Colors.transparent,
                  child: Icon(
                    Icons.add,
                    color: isHover
                        ? Constants.positiveBackgroundColor
                        : Constants.positiveColor,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                // TODO 언어 변경
                Text(
                  "작업 추가",
                  style: TextStyle(
                      color: isHover
                          ? Constants.positiveColor
                          : Colors.black.withOpacity(0.5)),
                )
              ],
            ),
            Container()
          ],
        ),
      ),
    );
  }

  _makeTaskCard() {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          width: 1.0,
          // 가장 하위 우선순위 색상으로
          color: isActive
              ? Constants.prioriy4Color
              : Constants.prioriy4Color.withOpacity(0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Container()),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isWriteMode = false;
                    });
                  },
                  // TODO 스타일 변경
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Constants.positiveBackgroundColor),
                  // TODO 언어 변경
                  child: Text(
                    "취소",
                    // TODO 스타일 변경
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () {},
                  // TODO 스타일 변경
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Constants.positiveColor),
                  // TODO 언어 변경
                  child: Text(
                    "작업 추가",
                    // TODO 스타일 변경
                    style: const TextStyle(
                      color: Constants.positiveBackgroundColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO 상위 위젯인 Section등에서 다른 작업을 선태하면 hasFocus 등으로 또한번 검사한다.
    // itemStateProvider.hasFocus && isWriteMode
    return isWriteMode ? _makeTaskCard() : _addTaskCard();
  }
}
