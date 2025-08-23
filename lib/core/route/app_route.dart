import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskforuszehra/core/route/app_route_name.dart';
import 'package:taskforuszehra/features/home/view/home_view.dart';
import 'package:taskforuszehra/features/navigator/navigator_view.dart';
import 'package:taskforuszehra/features/permission/permission_view.dart';
import 'package:taskforuszehra/features/task/task_view.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.homeView,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          BottomNavigator(navigationShell: navigationShell),

      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.homeView,
              builder: (context, state) => HomeView(),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: Routes.task, builder: (context, state) => TaskView()),
          ],
        ),
      ],
    ),
    GoRoute(
      path: Routes.permission,
      builder: (context, state) => PermissionView(),
    ),
  ],
);
