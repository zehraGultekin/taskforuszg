import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskforuszehra/core/route/app_route.dart';
import 'package:taskforuszehra/core/theme/app_theme.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Task for Us Zehra",
      theme: AppTheme.theme,
      routerConfig: router,
    );
  }
}
