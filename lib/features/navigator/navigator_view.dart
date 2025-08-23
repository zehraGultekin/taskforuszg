import 'package:flutter/material.dart';
import 'package:taskforuszehra/features/activies/view/activities_view.dart';
import 'package:taskforuszehra/features/home/view/home_view.dart';
import 'package:taskforuszehra/features/navigator/view/widgets/navigator_widgets.dart';
import 'package:taskforuszehra/features/settings/settings_view.dart';
import 'package:taskforuszehra/features/task/task_view.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 0;

  final List<Widget> pages = const [
    HomeView(),
    TaskView(),
    ActivitiesView(),
    SettingsView(),
  ];

  void onTabItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildTabIcon(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => onTabItem(index),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withValues(alpha: 0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),

          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.3),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Icon(
          icon,
          size: 28,
          color: isSelected ? Colors.white : Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
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
              isSelected: _selectedIndex == 0,
              onTap: () => onTabItem(0),
            ),
            TabIcon(
              icon: Icons.assignment,
              isSelected: _selectedIndex == 1,
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
              isSelected: _selectedIndex == 2,
              onTap: () => onTabItem(2),
            ),
            TabIcon(
              icon: Icons.settings,
              isSelected: _selectedIndex == 3,
              onTap: () => onTabItem(3),
            ),
          ],
        ),
      ),
    );
  }
}
