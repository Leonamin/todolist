class TodoSection {
  int id;
  int projectId;
  String name;
  int createdAt;
  int modifiedAt;
  int sectionOrder;

  TodoSection({
    required this.id,
    required this.projectId,
    required this.name,
    required this.createdAt,
    required this.modifiedAt,
    required this.sectionOrder,
  });
}
