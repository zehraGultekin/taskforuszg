import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskforuszehra/core/route/app_route_name.dart';
import 'package:taskforuszehra/features/activies/view/activities_view.dart';
import 'package:taskforuszehra/features/activies/view/add_duration.dart';
import 'package:taskforuszehra/features/home/view/home_view.dart';
import 'package:taskforuszehra/features/navigator/navigator_view.dart';
import 'package:taskforuszehra/features/permission/view/permission_request.dart';
import 'package:taskforuszehra/features/permission/view/permission_view.dart';
import 'package:taskforuszehra/features/qr/view/widgets/qr_view.dart';
import 'package:taskforuszehra/features/task/view/task_view.dart';
import 'package:taskforuszehra/features/task/view/create_task_view.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

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
              name: Routes.homeViewName,
              path: Routes.homeView,
              builder: (context, state) => HomeView(),
              routes: [
                GoRoute(
                  path: Routes.permission,
                  name: Routes.permissionName,
                  builder: (context, state) => PermissionView(),
                  parentNavigatorKey: _rootNavigatorKey,
                ),
                GoRoute(
                  path: Routes.createPermission,
                  name: Routes.createPermissionName,
                  builder: (context, state) => PermissionRequest(),
                  parentNavigatorKey: _rootNavigatorKey,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: Routes.task,
              path: Routes.task,
              builder: (context, state) => TaskView(),
              routes: [
                GoRoute(
                  name: Routes.createTaskName,
                  path: Routes.createTask,
                  builder: (context, state) => CreateTask(),
                  parentNavigatorKey: _rootNavigatorKey,
                ),
              ],
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              name: Routes.activityName,
              path: Routes.activity,
              builder: (context, state) => ActivitiesView(),
              routes: [
                GoRoute(
                  path: Routes.addDuration,
                  name: Routes.addDurationName,
                  builder: (context, state) => AddDuration(),
                  parentNavigatorKey: _rootNavigatorKey,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.qrkod,
              name: Routes.qrkodName,
              builder: (context, state) => QrView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
