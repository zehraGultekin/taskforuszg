import 'package:go_router/go_router.dart';
import 'package:taskforuszehra/core/route/app_route_name.dart';
import 'package:taskforuszehra/features/activies/view/activities_view.dart';
import 'package:taskforuszehra/features/home/view/home_view.dart';
import 'package:taskforuszehra/features/navigator/navigator_view.dart';
import 'package:taskforuszehra/features/permission/permission_request.dart';
import 'package:taskforuszehra/features/permission/permission_view.dart';
import 'package:taskforuszehra/features/settings/settings_view.dart';
import 'package:taskforuszehra/features/task/task_view.dart';
import 'package:taskforuszehra/features/task/widgets/create_task.dart';

//kalıcı bir bottom içinde gezinmek istiyorsam Shell route kullanmam gerekiyor.Kalıcı bir alt sekme çubuğu sağlıyor.

class AppRoute {
  static GoRouter router = GoRouter(
    //static verdim çünkü dışarıdan erişilebilir olmasını sağlıyor diğer türlü mainde router ı tanımlamak için nesne üretmek zorunda kalacaktım.
    initialLocation: "/navigator",
    routes: [
      GoRoute(
        path: "/",
        name: AppRouteName.home.name,
        builder: (context, state) {
          return HomeView();
        },
      ),

      GoRoute(
        path: "/task",
        name: AppRouteName.task.name,
        builder: (context, state) {
          return TaskView();
        },
      ),
      GoRoute(
        path: "/activities",
        name: AppRouteName.activities.name,
        builder: (context, state) {
          return ActivitiesView();
        },
      ),
      GoRoute(
        path: "/settings",
        name: AppRouteName.settings.name,
        builder: (context, state) {
          return SettingsView();
        },
      ),
      GoRoute(
        path: "/navigator",
        name: AppRouteName.navigator.name,
        builder: (context, state) {
          return BottomNavigator();
        },
      ),
      GoRoute(
        path: "/permission",
        name: AppRouteName.permission.name,
        builder: (context, state) {
          return PermissionView();
        },
      ),
      GoRoute(
        path: "/permission_request",
        name: AppRouteName.permission_request.name,
        builder: (context, state) {
          return PermissionRequest();
        },
      ),
      GoRoute(
        path: "/task_create",
        name: AppRouteName.task_create.name,
        builder: (context, state) {
          return CreateTask();
        },
      ),
    ],
  );
}
