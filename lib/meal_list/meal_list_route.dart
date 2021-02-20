import 'package:flutter/material.dart';
import 'package:meal_planner/meal_list/meal_list_screen.dart';

class MealListRoute {
  static String key = '/meal-list';
  static Widget builder(BuildContext context) {
    return Scaffold(body: MealListScreen());
  }
}
