import 'package:flutter/material.dart';
import 'package:meal_planner/new_meal/new_meal_screen.dart';

class NewMealRoute {
  static String key = '/new-meal';
  static Widget builder(BuildContext context) {
    dynamic args = ModalRoute.of(context).settings.arguments;

    return NewMealScreen(meal: args['meal']);
  }
}
