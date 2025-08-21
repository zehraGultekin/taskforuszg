

import 'package:flutter/material.dart';
import 'package:taskforuszehra/core/theme/app_theme.dart';
import 'package:taskforuszehra/features/home/view/home_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task for Us Zehra",
      theme: AppTheme.theme,
      home: HomeView()
    );
  }
}
