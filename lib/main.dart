import 'package:flutter/material.dart';
import 'package:taskforuszehra/core/route/app_route.dart';
import 'package:taskforuszehra/core/theme/app_theme.dart';
import 'package:taskforuszehra/features/home/view/home_view.dart';
import 'package:taskforuszehra/features/navigator/navigator.dart';
import 'package:taskforuszehra/features/task/task_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Task for Us Zehra",
      theme: AppTheme.theme,
      routerConfig: AppRoute.router,
    );
  }
}
