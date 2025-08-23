import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskforuszehra/core/route/app_route.dart';
import 'package:taskforuszehra/core/route/app_route_name.dart';
import 'package:taskforuszehra/core/widgets/appbar.dart';
import 'package:taskforuszehra/features/permission/repository/model/permission_model.dart';

class PermissionView extends StatefulWidget {
  const PermissionView({super.key});

  @override
  State<PermissionView> createState() => _PermissionViewState();
}

class _PermissionViewState extends State<PermissionView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          title: "İzinlerim",
          height: 120,
          leading: IconButton(
            onPressed: () {
              context.goNamed(AppRouteName.navigator.name);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.black,
            enableFeedback: false,

            tabs: [
              Tab(text: "Bekleniyor"),
              Tab(text: "Onaylayan"),
              Tab(text: "Reddedilen"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PermissionList(status: "Onaylandı"),
            PermissionList(status: "Bekleniyor"),
            PermissionList(status: "Reddedilen"),
          ],
        ),

        floatingActionButton: SizedBox(
          height: 40,
          width: 160,
          child: FloatingActionButton(
            onPressed: () {
              context.goNamed(AppRouteName.permission_request.name);
            },
            backgroundColor: Theme.of(context).colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Colors.white),
                SizedBox(width: 5),
                Text(
                  "İzin Talebi Oluştur",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PermissionList extends StatelessWidget {
  final String status;
  const PermissionList({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final data = filter(status);

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Permissionwidget(
          id: data[index].id,
          name: data[index].name,
          status: data[index].status,
        );
      },
    );
  }
}

class Permissionwidget extends StatelessWidget {
  final int id;
  final String name;
  final String status;

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
        subtitle: Text(status, style: Theme.of(context).textTheme.bodySmall),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 20,
          color: Colors.grey,
        ),
      ),
    );
  }
}
