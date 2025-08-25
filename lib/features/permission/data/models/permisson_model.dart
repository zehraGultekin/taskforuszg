enum PermissionStatus { approved, pending, rejected }

class PermissionModel {
  final String name;
  final PermissionStatus status;
  final DateTime? end;
  final DateTime? start;

  PermissionModel({
    required this.end,
    required this.start,
    required this.name,
    required this.status,
  });
}

final List<PermissionModel> items = [
  PermissionModel(
    name: "Zehra",
    status: PermissionStatus.pending,
    end: DateTime(2025, 08, 25),
    start: DateTime(2025, 08, 24),
  ),
  PermissionModel(
    name: "Büşra",
    status: PermissionStatus.approved,
    end: DateTime(2025, 08, 25),
    start: DateTime(2025, 08, 24),
  ),
  PermissionModel(
    name: "Buğra",
    status: PermissionStatus.rejected,
    end: DateTime(2025, 08, 25),
    start: DateTime(2025, 08, 24),
  ),
];

List<PermissionModel> filter(PermissionStatus status) {
  return items.where((element) => element.status == status).toList();
}
