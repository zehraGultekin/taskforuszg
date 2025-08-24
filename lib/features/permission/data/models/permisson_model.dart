enum PermissionStatus { approved, pending, rejected }

class PermissionModel {
  final String name;
  final PermissionStatus status;

  PermissionModel({required this.name, required this.status});
}

final List<PermissionModel> items = [
  PermissionModel(name: "Zehra", status: PermissionStatus.pending),
  PermissionModel(name: "Büşra", status: PermissionStatus.approved),
  PermissionModel(name: "Buğra", status: PermissionStatus.rejected),
];

List<PermissionModel> filter(PermissionStatus status) {
  return items.where((element) => element.status == status).toList();
}
