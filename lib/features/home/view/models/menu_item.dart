import 'package:flutter/material.dart';
import 'package:taskforuszehra/core/route/app_route_name.dart';

class MenuItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final String route;

  const MenuItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.route,
  });

  static final List<MenuItem> items = [
    MenuItem(
      icon: Icons.calendar_today,
      title: "İzinlerim",
      subtitle: "İzin talepleri ve izin geçmişi",
      route: Routes.permission,
    ),
    MenuItem(
      icon: Icons.play_circle_outline_sharp,
      title: "İşe Başla",
      subtitle: "Mesai başlatma ve bitiş işlemleri",
      route: Routes.homeView,
    ),
  ];
}
