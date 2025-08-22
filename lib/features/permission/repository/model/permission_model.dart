class PermissionModel {
  final int id;
  final String name;
  final String status;

  PermissionModel({required this.id, required this.name, required this.status});
}

final List<PermissionModel> items = [
  PermissionModel(id: 1, name: "Zehra", status: "Onaylandı"),
  PermissionModel(id: 2, name: "Büşra", status: "Bekleniyor"),
  PermissionModel(id: 4, name: "Büşra", status: "Bekleniyor"),

  PermissionModel(id: 2, name: "Buğra", status: "Reddedilen"),
];

List<PermissionModel> filter(String status) {
  return items.where((element) => element.status == status).toList();
}
