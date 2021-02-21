import 'package:flutter/material.dart';
import 'package:meal_planner/meal/meal.dart';
import 'package:meal_planner/meal/meal_route.dart';
import 'package:meal_planner/meal/meal_service.dart';
import 'package:meal_planner/new_meal/meal_add_edit_route.dart';
import 'package:meal_planner/user/user_service.dart';

class MealList extends StatelessWidget {
  MealService _mealService = MealService(ownerEmail: UserService().user.email);
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
            (Meal meal) => Dismissible(
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                alignment: Alignment.centerRight,
                color: Colors.red,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              confirmDismiss: (DismissDirection direction) async {
                return showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text('Warning!'),
                    content: Text(
                        'Are you sure you want to delete the meal ${meal.name}? This can not be reverted!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                );
              },
              onDismissed: (DismissDirection direction) async {
                await _mealService.deleteMeal(meal);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${meal.name} deleted.'),
                  ),
                );
              },
              key: Key(meal.documentId),
              child: ListTile(
                title: Text(meal.name),
                onTap: () => navigateTo(context, meal),
              ),
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
