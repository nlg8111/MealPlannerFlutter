import 'package:flutter/material.dart';
import 'package:meal_planner/meal/meal.dart';

class MealScreen extends StatelessWidget {
  final Meal meal;
  MealScreen({@required this.meal});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            Text(meal.name),
            SizedBox(
              height: 30.0,
            ),
            Text(meal.recipe),
            SizedBox(
              height: 30.0,
            ),
            Text(meal.ingredients),
          ],
        ),
      ),
    );
  }
}
