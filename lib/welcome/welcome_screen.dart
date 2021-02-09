import 'package:flutter/material.dart';
import 'package:meal_planner/constants.dart';
import 'package:meal_planner/user/user_service.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String email;
  String password;

  Future<void> login() async {
    await UserService().login(email, password);
    // moveToNextScreen();
  }

  Future<void> register() async {
    await UserService().register(email, password);
    // moveToNextScreen();
  }

  void moveToNextScreen() {
    // Todo: change
    Navigator.pushNamed(context, '/new-meal');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(kSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Authenticate',
                  style: kHeadingTextStyle,
                ),
                SizedBox(
                  height: kSize,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(labelText: 'Email'),
                  onChanged: (String value) => email = value,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                  onChanged: (String value) => password = value,
                ),
                SizedBox(
                  height: kSize,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: login,
                      child: Text('Login'),
                    ),
                    FlatButton(
                      onPressed: register,
                      child: Text('Register'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
