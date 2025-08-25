import 'package:flutter/material.dart';
import 'package:taskforuszehra/features/permission/data/models/permisson_model.dart';

class PermissionList extends StatelessWidget {
  final PermissionStatus status;
  const PermissionList({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final data = filter(status);

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Container(
          height: 65,
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
                Text(data[index].name),
              ],
            ),
            children: [
              Column(
                children: [
                  Text("Açıklama : deneme"),
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
