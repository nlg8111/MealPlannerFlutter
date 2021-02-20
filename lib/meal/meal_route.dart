import 'package:flutter/material.dart';
import 'package:meal_planner/meal/meal_screen.dart';

class MealRoute {
  static String key = '/meal';
  static Widget builder(BuildContext context) {
    dynamic args = ModalRoute.of(context).settings.arguments;

    return Scaffold(body: MealScreen(meal: args['meal']));
  }
}
