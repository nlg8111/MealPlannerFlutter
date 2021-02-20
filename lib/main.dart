import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meal_planner/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MealPlannerApp());
}

class MealPlannerApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final AppRoutes _routes = AppRoutes();

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
            initialRoute: _routes.initialRoute,
            routes: _routes.map,
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
