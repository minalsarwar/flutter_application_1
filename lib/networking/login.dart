// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';
// import 'app_state.dart'; // The path to your ApplicationState class

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController emailController = TextEditingController();
//   bool isEmailTooLong = false;

//   @override
//   void dispose() {
//     emailController.dispose();
//     super.dispose();
//   }

//   void validateEmail(String value) {
//     if (value.length > 50) {
//       setState(() {
//         isEmailTooLong = true;
//       });
//     } else {
//       setState(() {
//         isEmailTooLong = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Container(
//               width: double.infinity,
//               child: Image.asset(
//                 'android/assets/asset1.jpg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Log In',
//                     style: TextStyle(
//                       fontSize: 22.0,
//                       color: Theme.of(context).brightness == Brightness.dark
//                           ? Colors.white
//                           : Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               width: double.infinity,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: TextField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     contentPadding:
//                         EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: BorderSide(
//                         color: isEmailTooLong ? Colors.red : Colors.black,
//                         width: 1.0,
//                       ),
//                     ),
//                     errorText: isEmailTooLong
//                         ? 'Email can only be of 50 characters'
//                         : null,
//                   ),
//                   onChanged: (value) {
//                     validateEmail(value);
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 35.0, vertical: 5.0),
//               child: Align(
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   '${emailController.text.length}/50',
//                   style: TextStyle(
//                     color: Theme.of(context).brightness == Brightness.dark
//                         ? Color.fromARGB(255, 196, 189, 189)
//                         : Color.fromARGB(226, 86, 86, 86),
//                     fontSize: 12,
//                   ),
//                 ),
//               ),
//             ),
//             // const SizedBox(height: 5),
//             SizedBox(
//               width: double.infinity,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: TextField(
//                   maxLength: 20,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     contentPadding:
//                         EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: BorderSide(color: Colors.black, width: 1.0),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
//               child: SizedBox(
//                 width: double.infinity,
//                 height: 45,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/homepage');
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromARGB(255, 102, 88, 160),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                   ),
//                   child: Text(
//                     'Sign In',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Padding(
//               padding: EdgeInsets.only(left: 20.0),
//               child: Row(
//                 children: <Widget>[
//                   Text("Don't have an account yet? "),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, '/signup');
//                     },
//                     child: Text(
//                       "Sign Up!",
//                       style: TextStyle(
//                         color: Colors.purple[300],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 10),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Text("Forgot Password?"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isEmailTooLong = false;
  bool isPasswordIncorrect = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void validateEmail(String value) {
    if (value.length > 50) {
      setState(() {
        isEmailTooLong = true;
      });
    } else {
      setState(() {
        isEmailTooLong = false;
      });
    }
  }

  void signIn(BuildContext context) async {
    final appState = Provider.of<ApplicationState>(context, listen: false);
    final email = emailController.text;
    final password = passwordController.text;

    try {
      await appState.signInWithFirebase(email, password);
      // If successful, navigate to the homepage
      Navigator.pushNamed(context, '/homepage');
    } catch (e) {
      setState(() {
        isPasswordIncorrect = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Image.asset(
                'android/assets/asset1.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: isEmailTooLong ? Colors.red : Colors.black,
                        width: 1.0,
                      ),
                    ),
                    errorText: isEmailTooLong
                        ? 'Email can only be of 50 characters'
                        : null,
                  ),
                  onChanged: (value) {
                    validateEmail(value);
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 5.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${emailController.text.length}/50',
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Color.fromARGB(255, 196, 189, 189)
                        : Color.fromARGB(226, 86, 86, 86),
                    fontSize: 12,
                  ),
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: passwordController,
                  maxLength: 20,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Display an error message if the password is incorrect
            if (isPasswordIncorrect)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                child: Text(
                  'Incorrect credentials/email/password entered!',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    signIn(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 102, 88, 160),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            // Google icon button
            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            //   child: SizedBox(
            //     width: double.infinity,
            //     height: 45,
            //     child: InkWell(
            //       // onTap: () async {
            //       //   // Access the application state using Provider
            //       //   ApplicationState appState =
            //       //       Provider.of<ApplicationState>(context, listen: false);

            //       //   // Call the signInWithGoogle method from app_state.dart
            //       //   UserCredential? userCredential =
            //       //       await appState.signInWithGoogle();

            //       //   if (userCredential != null) {
            //       //     // Handle sign-in success or navigate to the appropriate screen
            //       //     // For example, you can navigate to the home page:
            //       //     print("sign in");
            //       //     Navigator.pushNamed(context, '/homepage');
            //       //   } else {
            //       //     // Handle sign-in failure or cancellation
            //       //     print('Google Sign-In failed or canceled.');
            //       //   }
            //       // },
            //       onTap: () async {
            //         // print('hello 123');
            //         // Access the application state using Provider
            //         // ApplicationState appState =
            //         //     Provider.of<ApplicationState>(context, listen: false);

            //         // try {
            //         //   // Call the signInWithGoogle method from app_state.dart
            //         //   String? userCredential =
            //         //       await appState.signInwithGoogle();

            //         //   if (userCredential != null) {
            //         //     // Handle sign-in success or navigate to the appropriate screen
            //         //     // For example, you can navigate to the home page:
            //         //     print("User signed in: ${userCredential}");
            //         //     Navigator.pushNamed(context, '/homepage');
            //         //   } else {
            //         //     // Handle sign-in failure or cancellation
            //         //     print('Google Sign-In failed or canceled.');
            //         //   }
            //         // } catch (e) {
            //         //   // Handle any errors that occur during the sign-in process
            //         //   print('Error signing in with Google: $e');
            //         // }

            //         // await ApplicationState().signOut();

            //         // await ApplicationState().signInwithGoogle();
            //         ApplicationState appState =
            //             Provider.of<ApplicationState>(context, listen: false);

            //         try {
            //           // Call the signInWithGoogle method from app_state.dart
            //           UserCredential? userCredential =
            //               await appState.signInwithGoogle();

            //           if (userCredential != null) {
            //             // Extract user information
            //             String? userEmail = userCredential.user?.email;

            //             // Print user's email on the console
            //             print("User signed in: $userEmail");

            //             // Navigate to the homepage
            //             Navigator.pushNamed(context, '/homepage');
            //           } else {
            //             // Handle sign-in failure or cancellation
            //             print('Google Sign-In failed or canceled.');
            //           }
            //         } catch (e) {
            //           // Handle any errors that occur during the sign-in process
            //           print('Error signing in with Google: $e');
            //         }
            //       },

            //       child: Card(
            //         color: Colors.white,
            //         elevation: 5.0,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(30.0),
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.all(10.0),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Image.asset(
            //                 'android/assets/googleLogo.png', // Replace with the actual path
            //                 height: 30.0,
            //                 width: 30.0,
            //               ),
            //               SizedBox(width: 10.0),
            //               Text(
            //                 'Sign In with Google',
            //                 style: TextStyle(
            //                   color: Colors.black,
            //                   fontSize: 16.0,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            //////////
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Google Sign-In Button
                    InkWell(
                      onTap: () async {
                        ApplicationState appState =
                            Provider.of<ApplicationState>(context,
                                listen: false);

                        try {
                          // Call the signInWithGoogle method from app_state.dart
                          UserCredential? userCredential =
                              await appState.signInwithGoogle();

                          if (userCredential != null) {
                            // Extract user information
                            String? userEmail = userCredential.user?.email;

                            // Print user's email on the console
                            print("User signed in: $userEmail");

                            // Navigate to the homepage
                            Navigator.pushNamed(context, '/homepage');
                          } else {
                            // Handle sign-in failure or cancellation
                            print('Google Sign-In failed or canceled.');
                          }
                        } catch (e) {
                          // Handle any errors that occur during the sign-in process
                          print('Error signing in with Google: $e');
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20.0,
                        child: Image.asset(
                          'android/assets/googleLogo.png',
                          height: 40.0,
                          width: 40.0,
                        ),
                      ),
                    ),

                    // Facebook Sign-In Button
                    InkWell(
                      onTap: () async {
                        // ApplicationState appState =
                        //     Provider.of<ApplicationState>(context,
                        //         listen: false);
                        // await appState.signInWithFacebook(context);
                        ApplicationState appState =
                            Provider.of<ApplicationState>(context,
                                listen: false);

                        bool success =
                            await appState.signInWithFacebook(context);

                        if (success) {
                          // Navigate to the homepage
                          Navigator.pushReplacementNamed(context, '/homepage');
                          print('Welcome to Facebook!');
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20.0,
                        child: Image.asset(
                          'android/assets/facebook.png', // Replace with the actual path
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Row(
                children: <Widget>[
                  Text("Don't have an account yet? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      "Sign Up!",
                      style: TextStyle(
                        color: Colors.purple[300],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Forgot Password?"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
