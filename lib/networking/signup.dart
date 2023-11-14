import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isEmailTooLong = false;
  bool isPasswordMatchError = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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

  void validatePasswordMatch(String password, String confirmPassword) {
    setState(() {
      isPasswordMatchError = password != confirmPassword;
    });
  }

  void signUp(BuildContext context) async {
    // Use appState to access Firebase authentication methods.
    final appState = Provider.of<ApplicationState>(context, listen: false);
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (password != confirmPassword) {
      validatePasswordMatch(password, confirmPassword);
      return;
    }

    try {
      // Use Firebase Authentication to create a new user
      await appState.signUpWithFirebase(email, password);

      // User registration is successful, you can navigate to another page
      Navigator.pushNamed(context, '/login');
    } catch (e) {
      // Handle any registration errors, e.g., if the email is already in use
      print("Error during registration: $e");
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
                'android/assets/asset2.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Sign up',
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
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        maxLength: 20,
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        maxLength: 20,
                        obscureText: true,
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isPasswordMatchError)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                child: Text(
                  'Passwords entered should be the same!',
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
                    signUp(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 102, 88, 160),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            // Google icon button
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: InkWell(
                  onTap: () async {
                    print('hello 123');
                    // // Access the application state using Provider
                    // ApplicationState appState =
                    //     Provider.of<ApplicationState>(context, listen: false);

                    // try {
                    //   // Call the signInWithGoogle method from app_state.dart
                    //   UserCredential? userCredential =
                    //       await appState.signUpWithGoogle();

                    //   if (userCredential != null) {
                    //     // Handle sign-in success or navigate to the appropriate screen
                    //     // For example, you can navigate to the home page:
                    //     print(
                    //         "User signed up: ${userCredential.user?.displayName}");
                    //     Navigator.pushNamed(context, '/login');
                    //   } else {
                    //     // Handle sign-in failure or cancellation
                    //     print('Google Sign-Up failed or canceled.');
                    //   }
                    // } catch (e) {
                    //   // Handle any errors that occur during the sign-in process
                    //   print('Error signing up with Google: $e');
                    // }
                  },
                  child: Card(
                    color: Colors.white,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'android/assets/googleLogo.png', // Replace with the actual path
                            height: 30.0,
                            width: 30.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Sign Up with Google',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Row(
                children: <Widget>[
                  Text("Have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.purple[300],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
