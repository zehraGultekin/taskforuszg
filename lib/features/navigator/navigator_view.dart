import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskforuszehra/features/navigator/view/widgets/navigator_widgets.dart';

class BottomNavigator extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavigator({super.key, required this.navigationShell});

  void onTabItem(int index) {
    navigationShell.goBranch(index);
    {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withAlpha(2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TabIcon(
              icon: Icons.home,
              isSelected: navigationShell.currentIndex == 0,
              onTap: () => onTabItem(0),
            ),
            TabIcon(
              icon: Icons.assignment,
              isSelected: navigationShell.currentIndex == 1,
              onTap: () => onTabItem(1),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.qr_code_scanner, size: 28, color: Colors.white),
            ),
            TabIcon(
              icon: Icons.work,
              isSelected: navigationShell.currentIndex == 2,
              onTap: () => onTabItem(2),
            ),
            TabIcon(
              icon: Icons.settings,
              isSelected: navigationShell.currentIndex == 3,
              onTap: () => onTabItem(3),
            ),
          ],
        ),
      ),
    );
  }
}
