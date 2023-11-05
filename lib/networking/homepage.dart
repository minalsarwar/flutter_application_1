// import 'package:flutter/material.dart';

// class DummyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(top: 2.0),
//               child: Container(
//                 width: double.infinity,
//                 child: Image.asset(
//                   'android/assets/asset3.jpg',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Text(
//               'Welcome to the homepage!',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'You are one lucky user!',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 color: Colors.deepPurple,
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             Icon(
//               Icons.sentiment_satisfied,
//               size: 60.0,
//               color: Color.fromARGB(255, 102, 88, 160),
//             ),
//             const SizedBox(height: 20.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/signup');
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromARGB(255, 102, 88, 160),
//                   ),
//                   child: Text('Sign Up'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/login');
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromARGB(255, 102, 88, 160),
//                   ),
//                   child: Text('Log In'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class DummyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<ApplicationState>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Container(
                width: double.infinity,
                child: Image.asset(
                  'android/assets/asset3.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              'Welcome to the homepage!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'You are one lucky user!',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20.0),
            Icon(
              Icons.sentiment_satisfied,
              size: 60.0,
              color: Color.fromARGB(255, 102, 88, 160),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                await appState.signOut();
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 102, 88, 160),
              ),
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
