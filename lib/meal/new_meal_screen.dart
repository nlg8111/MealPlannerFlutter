import 'package:flutter/material.dart';
import 'package:meal_planner/meal/meal_service.dart';
import 'package:meal_planner/user/user_service.dart';

import 'meal.dart';

class NewMealScreen extends StatefulWidget {
  @override
  _NewMealScreenState createState() => _NewMealScreenState();
}

class _NewMealScreenState extends State<NewMealScreen> {
  MealService _mealService = MealService(ownerEmail: UserService().user.email);
  String name;
  String recipe;
  String ingredients;

  void addNewMeal() async {
    Meal meal = Meal(
      name: name,
      recipe: recipe,
      ingredients: ingredients,
    );

    await _mealService.saveMeal(meal);

    Navigator.pushNamed(
      context,
      '/meal',
      arguments: {'meal': meal},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            Text('New meal screen'),
            TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                name = value;
              },
            ),
            TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                labelText: 'Recipe',
              ),
              onChanged: (value) {
                recipe = value;
              },
              minLines: null,
              maxLines: null,
            ),
            TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                labelText: 'Ingredients',
              ),
              onChanged: (value) {
                ingredients = value;
              },
              minLines: null,
              maxLines: null,
            ),
            FlatButton(onPressed: addNewMeal, child: Text('Save'))
          ],
        ),
      ),
    );
  }
}
