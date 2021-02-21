import 'package:flutter/material.dart';
import 'package:meal_planner/meal/meal.dart';
import 'package:meal_planner/new_meal/meal_add_edit_route.dart';

class MealScreen extends StatefulWidget {
  final Meal meal;
  MealScreen({@required this.meal});

  @override
  _MealScreenState createState() => _MealScreenState(meal: meal);
}

class _MealScreenState extends State<MealScreen> {
  Meal meal;
  _MealScreenState({@required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal'),
        actions: [
          FlatButton(
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () async {
              var newMeal =
                  await Navigator.pushNamed(context, NewMealRoute.key, arguments: {'meal': meal});

              print(newMeal);

              if (newMeal != null) {
                setState(() {
                  meal = newMeal;
                });
              }
            },
          )
        ],
      ),
      body: Padding(
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
