import 'package:flutter/material.dart';
import 'package:meal_planner/meal/meal.dart';
import 'package:meal_planner/meal/meal_route.dart';
import 'package:meal_planner/meal/meal_service.dart';
import 'package:meal_planner/new_meal/new_meal_route.dart';
import 'package:meal_planner/user/user_service.dart';

class MealList extends StatelessWidget {
  List<Meal> meals;
  MealList({@required this.meals});

  void navigateTo(BuildContext context, Meal meal) {
    Navigator.pushNamed(context, MealRoute.key, arguments: {'meal': meal});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: meals
          .map(
            (Meal meal) => ListTile(
              title: Text(meal.name),
              onTap: () => navigateTo(context, meal),
            ),
          )
          .toList(),
    );
  }
}

class MealListScreen extends StatelessWidget {
  MealService _mealService = MealService(ownerEmail: UserService().user.email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
        actions: [
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, NewMealRoute.key),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: StreamBuilder(
        stream: _mealService.allMealsStream,
        builder: (BuildContext context, AsyncSnapshot<List<Meal>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return MealList(meals: snapshot.data);
        },
      ),
    );
  }
}
