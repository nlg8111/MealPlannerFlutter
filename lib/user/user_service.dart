import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> login(String email, String password) async {
    UserCredential creds = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return creds.user;
  }

  Future<User> register(String email, String password) async {
    UserCredential creds = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return creds.user;
  }
}
