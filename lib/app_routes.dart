import 'package:flutter/material.dart';
import 'package:meal_planner/meal/meal_route.dart';
import 'package:meal_planner/meal/new_meal_route.dart';
import 'package:meal_planner/welcome/welcome_route.dart';

class AppRoutes {
  String get initialRoute => WelcomeRoute.key;

  Map<String, Widget Function(BuildContext)> get map => {
        WelcomeRoute.key: WelcomeRoute.builder,
        NewMealRoute.key: NewMealRoute.builder,
        MealRoute.key: MealRoute.builder,
      };
}