import 'package:flutter/material.dart';
import 'package:meal_planner/meal/meal_screen.dart';
import 'package:meal_planner/meal/meal_service.dart';
import 'package:meal_planner/user/user_service.dart';

import '../meal/meal.dart';

class MealAddEditScreen extends StatefulWidget {
  final Meal meal;
  MealAddEditScreen({this.meal});

  @override
  _MealAddEditScreenState createState() => _MealAddEditScreenState(meal: meal);
}

class _MealAddEditScreenState extends State<MealAddEditScreen> {
  MealService _mealService = MealService(ownerEmail: UserService().user.email);

  String name;
  String recipe;
  String ingredients;
  String documentId;

  _MealAddEditScreenState({Meal meal}) {
    name = meal?.name;
    recipe = meal?.recipe;
    ingredients = meal?.ingredients;
    documentId = meal?.documentId;
  }

  void save() async {
    Meal meal = Meal(
      name: name,
      recipe: recipe,
      ingredients: ingredients,
      documentId: documentId,
    );

    if (documentId == null) {
      await _mealService.saveNewMeal(meal);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MealScreen(meal: meal)),
      );
    } else {
      await _mealService.updateMeal(meal);
      Navigator.pop(context, meal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: [
              Text('New meal screen'),
              TextField(
                controller: TextEditingController()..text = name,
                textAlign: TextAlign.left,
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                controller: TextEditingController()..text = recipe,
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
                controller: TextEditingController()..text = ingredients,
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
              FlatButton(onPressed: save, child: Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
