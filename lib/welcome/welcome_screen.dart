import 'package:flutter/material.dart';
import 'package:meal_planner/constants.dart';
import 'package:meal_planner/meal_list/meal_list_screen.dart';
import 'package:meal_planner/user/user_service.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String email;
  String password;
  bool isLoading = false;
  UserService _userService = UserService();

  void toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> login() async {
    await _userService.login(email, password);
  }

  Future<void> register() async {
    await _userService.register(email, password);
  }

  Future<void> authenticate(Function callback) async {
    toggleLoading();

    try {
      await callback();
    } on AuthException catch (e) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {
              Scaffold.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
    }

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealListScreen(),
      ),
    );
    toggleLoading();
  }

  @override
  void initState() {
    super.initState();

    if (_userService.isLoggedIn) {
      toggleLoading();
      Future(() async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealListScreen(),
          ),
        );
        toggleLoading();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              isLoading
                  ? CircularProgressIndicator()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          onPressed: () => authenticate(login),
                          child: Text('Login'),
                        ),
                        FlatButton(
                          onPressed: () => authenticate(register),
                          child: Text('Register'),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
