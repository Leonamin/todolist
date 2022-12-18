// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todolist/constants.dart';
import 'package:todolist/models/todo_project.dart';

class ThemeData {
  String name;
  int value;

  ThemeData({required this.name, required this.value});
}

class TodoProjectCreateDialog extends StatefulWidget {
  TodoProjectCreateDialog({super.key});

  @override
  State<TodoProjectCreateDialog> createState() =>
      _TodoProjectCreateDialogState();
}

class _TodoProjectCreateDialogState extends State<TodoProjectCreateDialog> {
  final formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  static const _defaultBorderRadius = 8.0;

  final OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(_defaultBorderRadius),
    borderSide: BorderSide(color: Colors.black.withOpacity(0.5), width: 0),
  );

  final OutlineInputBorder _focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Colors.black, width: 0),
  );

  // FIXME 하드 코딩 설정
  static List<ThemeData> themeList = [
    ThemeData(name: "레드", value: 0xFFFFAFB0),
    ThemeData(name: "카키", value: 0xFFF0E68C),
    ThemeData(name: "라벤더", value: 0xFFE6E6FA),
    ThemeData(name: "라임", value: 0xFF00FF00),
    ThemeData(name: "네이비", value: 0xFF000080),
    ThemeData(name: "스노우", value: 0xFFFFFAFA),
  ];

  String dropdownValue = themeList.first.name;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // FIXME 하드코딩 언어
                  "프로젝트 추가",
                  // FIXME 하드코딩 폰트 스타일
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const Divider(),
                const SizedBox(height: 8),
                Text(
                  // FIXME 하드코딩 언어
                  "이름",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                    controller: _textController,
                    decoration: InputDecoration(
                      border: _border,
                      enabledBorder: _border,
                      focusedBorder: _focusedBorder,
                    )),
                const SizedBox(height: 8),
                Text(
                  // FIXME 하드코딩 언어
                  "테마",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton(
                        value: dropdownValue,
                        icon: Icon(null),
                        elevation: 16,
                        style: TextStyle(color: Colors.black),
                        underline: Container(),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        borderRadius:
                            BorderRadius.circular(_defaultBorderRadius),
                        items: themeList
                            .map<DropdownMenuItem<String>>((ThemeData value) {
                          return DropdownMenuItem<String>(
                            value: value.name,
                            child: Text(value.name),
                          );
                        }).toList(),
                        isExpanded: true,
                      ),
                    ),
                  ],
                )
              ],
            ),
            // 하단 부 버튼
            Column(
              children: [
                const Divider(),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: Container()),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
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
                        "프로젝트 추가",
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
