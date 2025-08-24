enum PermissionStatus { approved, pending, rejected }

class PermissionModel {
  final int id;
  final String name;
  final PermissionStatus status;

  PermissionModel({required this.id, required this.name, required this.status});
}

final List<PermissionModel> items = [
  PermissionModel(id: 1, name: "Zehra", status: PermissionStatus.pending),
  PermissionModel(id: 2, name: "Büşra", status: PermissionStatus.approved),
  PermissionModel(id: 4, name: "Buğra", status: PermissionStatus.rejected),
];

List<PermissionModel> filter(PermissionStatus status) {
  return items.where((element) => element.status == status).toList();
}
