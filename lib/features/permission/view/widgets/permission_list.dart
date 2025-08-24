import 'package:flutter/material.dart';
import 'package:taskforuszehra/features/permission/data/models/permisson_model.dart';
import 'package:taskforuszehra/features/permission/view/widgets/permission_tile.dart';

class PermissionList extends StatelessWidget {
  final PermissionStatus status;
  const PermissionList({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final data = filter(status);

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Permissionwidget(name: data[index].name, status: status);
      },
    );
  }
}
