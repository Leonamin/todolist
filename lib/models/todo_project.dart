import 'package:flutter/material.dart';

class TodoProject {
  int id;
  String name;
  int theme;
  ProjectViewType viewType;
  int createdAt;
  int modifiedAt;
  int projectGroupId;
  int projectClass;
  int projectOrder;

  TodoProject({
    required this.id,
    required this.name,
    required this.theme,
    required this.viewType,
    required this.createdAt,
    required this.modifiedAt,
    required this.projectGroupId,
    required this.projectClass,
    required this.projectOrder,
  });
}

enum ProjectViewType {
  // ignore: constant_identifier_names
  VerticalSimple,
  // ignore: constant_identifier_names
  HorizontalSimple,
  // ignore: constant_identifier_names
  VerticalSpecific,
  // ignore: constant_identifier_names
  HorizontalSpecific,
}
