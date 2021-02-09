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
  bool isLoading = false;

  Future<void> login() async {
    await UserService().login(email, password);
  }

  Future<void> register() async {
    await UserService().register(email, password);
  }

  Future<void> authenticate(Function callback) async {
    setState(() {
      isLoading = true;
    });

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

    setState(() {
      isLoading = false;
      Navigator.pushNamed(context, '/new-meal');
    });
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
