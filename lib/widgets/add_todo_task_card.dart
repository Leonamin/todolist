import 'dart:ui';

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

  final defaultColor = Colors.black.withOpacity(0.8);

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
            // isHover 상태가 저장되서 작업 취소를 누르면 호버 상태가 유지되는 버그가 발생해서 아래 구문 삽입
            isHover = false;
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
                // FIXME 하드코딩 글자
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
    return Column(
      children: [
        Card(
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Column(
              children: [
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        minLines: 1,
                        maxLines: 10,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        // TODO 글자 크기 정의 작업 제목
                        style: TextStyle(
                          fontSize: 18,
                          color: defaultColor,
                        ),
                      ),
                      TextFormField(
                        minLines: 1,
                        maxLines: 10,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        // TODO 글자 크기 정의 작업 내용
                        style: TextStyle(
                          color: defaultColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                // 마감 날짜 버튼 및 작업 분류 선택 버튼 행
                // 마감 날짜 글자는 다보이게 하고 남은 부분을 작업 분류로
                // 버튼이 호버링한 상태 꾹누른 상태에서 그림자가 안보인다. 눌렀다 떼면 잠깐 보인다.
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.date_range_outlined,
                            color: defaultColor,
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          // FIXME 하드코딩 글자
                          Text(
                            "마감 날짜",
                            style: TextStyle(
                              color: defaultColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Flexible(
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Flexible(
                                  child: Text(
                                //TODO 섹션 넣기
                                "프로젝트 글자 초과......",
                                maxLines: 1,
                                style: TextStyle(
                                  color: defaultColor,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )),
                              Text(
                                " / ",
                                style: TextStyle(
                                  color: defaultColor,
                                ),
                              ),
                              Flexible(
                                  child: Text(
                                //TODO 섹션 넣기
                                "섹션 글자 초과.........",
                                maxLines: 1,
                                style: TextStyle(
                                  color: defaultColor,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                            ],
                          )),
                    ),
                  ],
                ),
                // 기타 아이콘 버튼 행
                Row(
                  children: [
                    // TODO 라벨 기능
                    InkWell(
                      onTap: () {},
                      child: Tooltip(
                        // FIXME 하드코딩
                        message: "라벨 설정",
                        child: Icon(
                          Icons.label_outline_rounded,
                          color: defaultColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    // TODO 우선순위 기능
                    InkWell(
                      onTap: () {},
                      child: Tooltip(
                        // FIXME 하드코딩
                        message: "우선 순위 설정",
                        child: Icon(
                          Icons.flag_outlined,
                          color: defaultColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    // TODO 알람 기능
                    InkWell(
                      onTap: () {},
                      child: Tooltip(
                        // FIXME 하드코딩
                        message: "알람 설정",
                        child: Icon(
                          Icons.alarm,
                          color: defaultColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // 아래 저장 및 취소 버튼
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
              // FIXME 하드코딩 글자
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
              onPressed: () {
                // TODO 작업 추가 기능
              },
              // TODO 스타일 변경
              style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.positiveColor),
              // FIXME 하드코딩 글자
              child: Text(
                "작업 추가",
                // TODO 스타일 변경
                style: const TextStyle(
                  color: Constants.positiveBackgroundColor,
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO 상위 위젯인 Section등에서 다른 작업을 선태하면 hasFocus 등으로 또한번 검사한다.
    // itemStateProvider.hasFocus && isWriteMode
    return isWriteMode ? _makeTaskCard() : _addTaskCard();
  }
}
