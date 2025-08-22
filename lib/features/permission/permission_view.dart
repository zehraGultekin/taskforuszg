import 'package:flutter/material.dart';
import 'package:taskforuszehra/core/widgets/appbar.dart';

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
          leading: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.black,
            enableFeedback: false,

            tabs: [
              Tab(text: "Bekleyen"),
              Tab(text: "Onaylayan"),
              Tab(text: "Reddedilen"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("İzin bulunamadı")),
            Center(child: Text("İzin bulunamadı")),
            Center(child: Text("İizin bulunamadı")),
          ],
        ),
      ),
    );
  }
}
