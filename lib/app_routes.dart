import 'package:flutter/material.dart';
import 'package:meal_planner/meal/meal_route.dart';
import 'package:meal_planner/meal/new_meal_route.dart';
import 'package:meal_planner/welcome/welcome_route.dart';

abstract class AppRoute {
  String key;

  Widget builder(BuildContext context);
}

class AppRoutes {
  AppRoute welcome = WelcomeRoute();
  AppRoute newMeal = NewMealRoute();
  AppRoute meal = MealRoute();

  String get initialRoute => welcome.key;

  Map<String, Widget Function(BuildContext)> get map => {
        welcome.key: welcome.builder,
        newMeal.key: newMeal.builder,
        meal.key: meal.builder,
      };
}
