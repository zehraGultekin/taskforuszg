import 'package:flutter/material.dart';
import 'package:taskforuszehra/features/activies/activities_view.dart';
import 'package:taskforuszehra/features/home/view/home_view.dart';
import 'package:taskforuszehra/features/settings/settings_view.dart';
import 'package:taskforuszehra/features/task/task_view.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  List<Widget> pageList = [
    HomeView(),
    TaskView(),
    ActivitiesView(),
    SettingsView(),
  ];
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_selectedIndex],

      bottomNavigationBar: navBar(context),

      ///// Burada klasik olanı yaptım
      /* BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,

        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Task'),
          BottomNavigationBarItem(icon: Icon(Icons.badge), label: 'Activity'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ), */
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.white),
          ),
          child: const Icon(Icons.add, color: Colors.green),
        ),
      ),
    );
  }

  Container navBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      height: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _selectedIndex = 0;
              });
            },
            icon: Icon(
              Icons.home,
              size: 30,
              color: _selectedIndex == 0 ? Colors.green : Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _selectedIndex = 1;
              });
            },
            icon: Icon(
              Icons.badge,
              size: 30,
              color: _selectedIndex == 1 ? Colors.green : Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _selectedIndex = 2;
              });
            },
            icon: Icon(
              Icons.history,
              fontWeight: FontWeight.bold,
              size: 30,
              color: _selectedIndex == 2 ? Colors.green : Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _selectedIndex = 3;
              });
            },
            icon: Icon(
              Icons.settings,
              size: 30,
              color: _selectedIndex == 3 ? Colors.green : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
