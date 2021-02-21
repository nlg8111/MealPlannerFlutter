import 'package:flutter/material.dart';
import 'package:meal_planner/new_meal/meal_add_edit_screen.dart';

class NewMealRoute {
  static String key = '/meal-add-edit';
  static Widget builder(BuildContext context) {
    dynamic args = ModalRoute.of(context).settings.arguments;

    return MealAddEditScreen(meal: args['meal']);
  }
}
