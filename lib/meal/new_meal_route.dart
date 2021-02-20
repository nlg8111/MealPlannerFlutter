import 'package:flutter/material.dart';
import 'package:meal_planner/app_routes.dart';
import 'package:meal_planner/meal/new_meal_screen.dart';

class NewMealRoute implements AppRoute {
  String key = '/new-meal';
  Widget builder(BuildContext context) {
    return Scaffold(body: NewMealScreen());
  }
}
