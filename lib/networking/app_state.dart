import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ApplicationState extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  Future<void> signUpWithFirebase(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      // Handle errors here (e.g., email is already in use, password is too weak)
      print('Firebase Authentication Error: ${e.message}');
    }
  }

  // Add other authentication methods like sign in and sign out as needed
  Future<void> signInWithFirebase(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      // Handle login errors here (e.g., invalid credentials)
      print('Firebase Authentication Error: ${e.message}');

      if (e.code == 'user-not-found') {
        // Handle "User not found" error
        print('User not found');
        throw 'User not found';
      } else if (e.code == 'wrong-password') {
        // Handle "Wrong password" error
        print('Wrong password');
        throw 'Wrong password';
      } else {
        // Handle other login errors
        print('An error occurred. Please try again.');
        throw 'An error occurred. Please try again.';
      }
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
    print('Successfully signed out');
  }
}
