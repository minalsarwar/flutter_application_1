import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: Add text editing controllers (101)
  bool _isPasswordVisible = false; // Initially, password is hidden

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Codelab Tutorial'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset(
                  'android/assets/logo.png',
                  width: 350,
                  height: 150,
                ),
                const SizedBox(height: 5.0),
                const Text('SHRINE'),
              ],
            ),
            const SizedBox(height: 30.0),
            // TODO: Remove filled: true values (103)
            // TODO: Add TextField widgets (101)
            // TODO: Add button bar (101)
            const TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            // spacer
            const SizedBox(height: 12.0),
            // [Password]
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              obscureText: !_isPasswordVisible, // Toggle password visibility
            ),
            const SizedBox(height: 60),
            OverflowBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Center children horizontally
                  children: <Widget>[
                    ElevatedButton(
                      child: const Text('NEXT'),
                      onPressed: () {
                        // TODO: Show the next page (101)
                      },
                    ),
                    const SizedBox(height: 5), // Add space between the buttons
                    TextButton(
                      child: const Text('CANCEL'),
                      onPressed: () {
                        // TODO: Clear the text fields (101)
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
