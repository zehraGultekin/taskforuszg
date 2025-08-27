import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskforuszehra/features/permission/data/models/permisson_model.dart';
import 'package:taskforuszehra/features/permission/provider/permission_request_provider.dart';

class PermissionList extends ConsumerWidget {
  final PermissionStatus status;
  const PermissionList({super.key, required this.status});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allPermissions = ref.watch(permissionProvider);
    final data = allPermissions
        .where((element) => element.status == status)
        .toList();
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ExpansionTile(
            title: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.calendar_month),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data[index].name),
                    Row(
                      children: [
                        Text(
                          data[index].start != null
                              ? DateFormat(
                                  'yyyy,MM,dd',
                                ).format(data[index].start!)
                              : "-",
                        ),

                        Text("-"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            children: [
              Column(
                children: [
                  Text(
                    "Açıklama :${data[index].status.toString().split('.').last}",
                  ),
                  Text("Süre : 2 Gün"),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Durum:", style: TextStyle(color: Colors.orange)),
                      SizedBox(width: 5),
                      Text(
                        data[index].status.name,
                        style: TextStyle(color: Colors.orange),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
