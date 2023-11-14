// ignore_for_file: dead_code_on_catch_subtype, nullable_type_in_catch_clause

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  //new
  // final FirebaseAuth _auth2 = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Future<String?> signInwithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await _googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount!.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );
  //     await _auth2.signInWithCredential(credential);
  //   } on FirebaseAuthException catch (e) {
  //     print(e.message);
  //     throw e;
  //   }
  // }

  //gpt for signout first:
  final FirebaseAuth _auth2 = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInwithGoogle() async {
    try {
      // Sign out of GoogleSignIn if a user is signed in
      // await _googleSignIn.signOut();

      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // Return UserCredential
      return await _auth2.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print('Error during Google sign-in: ${e.message}');
      throw e;
    }
  }

  // Future<void> signOut() async {
  //   await _auth.signOut();
  //   notifyListeners();
  //   print('Successfully signed out');
  // }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  // Future<UserCredential> signInWithFacebook() async {
  //   try {
  //     // Trigger the sign-in flow
  //     final LoginResult loginResult = await FacebookAuth.instance.login();

  //     // Create a credential from the access token
  //     final OAuthCredential facebookAuthCredential =
  //         FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //     // Sign in with the Facebook credential
  //     final UserCredential userCredential = await FirebaseAuth.instance
  //         .signInWithCredential(facebookAuthCredential);

  //     // Retrieve additional user data (optional)
  //     final userData = await FacebookAuth.instance.getUserData(
  //       fields: "email, name",
  //     );
  //     print('Facebook User Data: $userData');

  //     // You can handle the retrieved user data here if needed.

  //     return userCredential;
  //   } on FirebaseAuthException catch (e) {
  //     // Handle FirebaseAuth exceptions
  //     print('Firebase Auth Exception: ${e.message}');
  //     throw e;
  //   } on Exception catch (e) {
  //     // Handle other exceptions
  //     print('Unexpected Exception: $e');
  //     throw e;
  //   }
  // }

//   //navigating as well
//   Future<UserCredential> signInWithFacebook(BuildContext context) async {
//     try {
//       final AccessToken? currentAccessToken =
//           await FacebookAuth.instance.accessToken;

//       if (currentAccessToken != null) {
//         // Log out from the existing Facebook session
//         await FacebookAuth.instance.logOut();
//       }

// // Proceed with the Facebook login flow
//       final LoginResult loginResult = await FacebookAuth.instance.login();

//       // Create a credential from the access token
//       final OAuthCredential facebookAuthCredential =
//           FacebookAuthProvider.credential(loginResult.accessToken!.token);

//       // Sign in with the Facebook credential
//       final UserCredential userCredential = await FirebaseAuth.instance
//           .signInWithCredential(facebookAuthCredential);

//       // Retrieve additional user data (optional)
//       final userData =
//           await FacebookAuth.instance.getUserData(fields: "email, name");
//       print('Facebook User Data: $userData');

//       // You can handle the retrieved user data here if needed.

//       // Navigate to the homepage
//       Navigator.pushReplacementNamed(context, '/homepage');

//       // Print welcome message
//       print('Welcome to Facebook!');

//       return userCredential;
//     } on FirebaseAuthException catch (e) {
//       // Handle FirebaseAuth exceptions
//       print('Firebase Auth Exception: ${e.message}');
//       throw e;
//     } on Exception catch (e) {
//       // Handle other exceptions
//       print('Unexpected Exception: $e');
//       throw e;
//     }
//   }

//og one
  // Future<UserCredential> signInWithFacebook(BuildContext context) async {
  //   try {
  //     final AccessToken? currentAccessToken =
  //         await FacebookAuth.instance.accessToken;

  //     if (currentAccessToken != null) {
  //       // Log out from the existing Facebook session
  //       await FacebookAuth.instance.logOut();
  //     }

  //     // Proceed with the Facebook login flow
  //     final LoginResult loginResult = await FacebookAuth.instance.login();

  //     // Create a credential from the access token
  //     final OAuthCredential facebookAuthCredential =
  //         FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //     // Sign in with the Facebook credential
  //     final UserCredential userCredential = await FirebaseAuth.instance
  //         .signInWithCredential(facebookAuthCredential);

  //     if (loginResult.status == LoginStatus.success) {
  //       print('Logged in!!!');
  //     }

  //     // Retrieve additional user data (optional)
  //     final userData =
  //         await FacebookAuth.instance.getUserData(fields: "email, name");
  //     print('Facebook User Data: $userData');

  //     // You can handle the retrieved user data here if needed.

  //     // Navigate to the homepage
  //     Navigator.pushReplacementNamed(context, '/homepage');
  //     print('Welcome to Facebook!');

  //     return userCredential;
  //   } on FirebaseAuthException catch (e) {
  //     // Handle FirebaseAuth exceptions
  //     print('Firebase Auth Exception: ${e.message}');
  //     throw e;
  //   } on Exception catch (e) {
  //     // Handle other exceptions
  //     print('Unexpected Exception: $e');
  //     throw e;
  //   }
  // }

  Future<bool> signInWithFacebook(BuildContext context) async {
    try {
      final AccessToken? currentAccessToken =
          await FacebookAuth.instance.accessToken;

      if (currentAccessToken != null) {
        // Log out from the existing Facebook session
        await FacebookAuth.instance.logOut();
      }

      // Proceed with the Facebook login flow
      final LoginResult loginResult = await FacebookAuth.instance.login();
      print(LoginResult);

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Sign in with the Facebook credential
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      if (loginResult.status == LoginStatus.success) {
        print('Logged in!!!');
      }

      // Retrieve additional user data (optional)
      final userData =
          await FacebookAuth.instance.getUserData(fields: "email, name");
      print('Facebook User Data: $userData');

      // You can handle the retrieved user data here if needed.

      // Return true to indicate successful login
      return true;
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuth exceptions
      print('Firebase Auth Exception: ${e.message}');
      throw e;
    } on Exception catch (e) {
      // Handle other exceptions
      print('Unexpected Exception: $e');
      throw e;
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth2.signOut();

      await _googleSignIn.signOut();

      await FacebookAuth.instance.logOut();
      print('User signed out successfully');

      // Navigate back to the login screen
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      print('Error signing out: $e');
      throw e;
    }
  }
}
