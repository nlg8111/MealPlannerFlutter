import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthException {
  AuthException({@required this.message});
  String message;
}

class UserService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> login(String email, String password) async {
    try {
      UserCredential creds = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return creds.user;
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message);
    }
  }

  Future<User> register(String email, String password) async {
    try {
      UserCredential creds = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return creds.user;
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message);
    }
  }
}
