import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskforuszehra/core/route/app_route_name.dart';
import 'package:taskforuszehra/core/widgets/appbar.dart';
import 'package:taskforuszehra/features/permission/data/models/permisson_model.dart';
import 'package:taskforuszehra/features/permission/view/widgets/permission_list.dart';

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
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.black,
            enableFeedback: false,

            tabs: [
              Tab(text: "Onaylanan"),
              Tab(text: "Beklenen"),
              Tab(text: "Reddedilen"),
            ],
          ),
        ),

        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 20),
          child: TabBarView(
            children: [
              PermissionList(status: PermissionStatus.approved),
              PermissionList(status: PermissionStatus.pending),
              PermissionList(status: PermissionStatus.rejected),
            ],
          ),
        ),

        floatingActionButton: SizedBox(
          height: 35,
          width: 180,
          child: FloatingActionButton(
            onPressed: () {
              context.goNamed(Routes.createPermissionName);
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
