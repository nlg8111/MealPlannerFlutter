import 'package:flutter/material.dart';
import 'package:meal_planner/meal_list/meal_list_screen.dart';

import 'meal_plan/meal_plan_screen.dart';

class LoggedInScaffold extends StatefulWidget {
  @override
  _LoggedInScaffoldState createState() => _LoggedInScaffoldState();
}

class _LoggedInScaffoldState extends State<LoggedInScaffold> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        pages: [
          MaterialPage(
            key: ValueKey('logged-in-scaffold'),
            child: IndexedStack(
              index: _currentIndex,
              children: [
                MealPlanScreen(),
                MealListScreen(),
              ],
            ),
          )
        ],
        onPopPage: (route, result) => false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.event_note), label: 'Plan'),
          BottomNavigationBarItem(icon: Icon(Icons.kitchen), label: 'Meals'),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() {
          _currentIndex = index;
        }),
      ),
    );
  }
}
