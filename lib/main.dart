import 'package:flutter/material.dart';
import 'package:meal_planner/meal/meal_screen.dart';
import 'package:meal_planner/meal/new_meal_screen.dart';
import 'package:meal_planner/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MealPlannerApp());
}

class MealPlannerApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('Something has gone awfully wrong :(');
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Meal Planner',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: '/welcome',
            routes: {
              '/welcome': (BuildContext context) => Scaffold(body: WelcomeScreen()),
              '/new-meal': (BuildContext context) => Scaffold(body: NewMealScreen()),
              '/meal': (BuildContext context) {
                dynamic args = ModalRoute.of(context).settings.arguments;

                return Scaffold(body: MealScreen(meal: args['meal']));
              },
            },
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
