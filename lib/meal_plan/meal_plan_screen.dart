import 'package:flutter/material.dart';
import 'package:meal_planner/meal/meal.dart';
import 'package:meal_planner/meal_list/meal_list_screen.dart';
import 'package:meal_planner/meal_plan/meal_plan_service.dart';
import 'package:meal_planner/user/user_service.dart';

class MealPlanScreen extends StatelessWidget {
  final MealPlanService mealPlanService = MealPlanService(ownerEmail: UserService().user.email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Meal Plan'),
        actions: [
          FlatButton(
            onPressed: () => print('Add random meal'),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: StreamBuilder(
        stream: mealPlanService.allMealsStream,
        builder: (BuildContext context, AsyncSnapshot<List<Meal>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return MealList(meals: snapshot.data, mealService: mealPlanService, right: false);
        },
      ),
    );
  }
}
