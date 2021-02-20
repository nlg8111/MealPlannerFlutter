import 'package:flutter/material.dart';
import 'package:meal_planner/app_routes.dart';
import 'package:meal_planner/meal/meal_screen.dart';

class MealRoute implements AppRoute {
  String key = '/meal';
  Widget builder(BuildContext context) {
    dynamic args = ModalRoute.of(context).settings.arguments;

    return Scaffold(body: MealScreen(meal: args['meal']));
  }
}
