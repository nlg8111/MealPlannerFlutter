import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meal_planner/user/user_service.dart';
import 'package:meal_planner/welcome/welcome_screen.dart';

import 'logged_in_scaffold.dart';

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
            home: Navigator(
              pages: [
                UserService().isLoggedIn
                    ? MaterialPage(
                        key: ValueKey('app-view'),
                        child: LoggedInScaffold(),
                      )
                    : MaterialPage(
                        key: ValueKey('welcome-screen'),
                        child: WelcomeScreen(),
                      )
              ],
              onPopPage: (route, result) => false,
            ),
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
