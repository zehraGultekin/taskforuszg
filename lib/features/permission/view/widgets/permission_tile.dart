import 'package:flutter/material.dart';
import 'package:taskforuszehra/features/permission/domain/entities/permisson_model.dart';

class Permissionwidget extends StatelessWidget {
  final int id;
  final String name;
  final PermissionStatus status;

  const Permissionwidget({
    super.key,
    required this.id,
    required this.name,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: ListTile(
        dense: true,
        leading: Text(id.toString()),
        title: Text(name, style: Theme.of(context).textTheme.bodyLarge),
        subtitle: Text(
          status.name,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 20,
          color: Colors.grey,
        ),
      ),
    );
  }
}
