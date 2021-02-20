import 'package:flutter/material.dart';
import 'package:meal_planner/welcome/welcome_screen.dart';

class WelcomeRoute {
  static String key = '/welcome';
  static Widget builder(BuildContext context) {
    return Scaffold(body: WelcomeScreen());
  }
}
