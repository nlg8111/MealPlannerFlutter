import 'package:flutter/material.dart';
import 'package:meal_planner/app_routes.dart';
import 'package:meal_planner/welcome/welcome_screen.dart';

class WelcomeRoute implements AppRoute {
  String key = '/welcome';
  Widget builder(BuildContext context) {
    return Scaffold(body: WelcomeScreen());
  }
}
