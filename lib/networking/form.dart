import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreForm extends StatefulWidget {
  @override
  _FirestoreFormState createState() => _FirestoreFormState();
}

class _FirestoreFormState extends State<FirestoreForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Firestore Form',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5.0,
            child: Container(
              height: 700.0,
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder(
                future:
                    FirebaseFirestore.instance.collection('1').doc('1').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      var data = snapshot.data?.data();
                      var name = data?['Name'];
                      var course = data?['Course'];
                      var imageUrl = data?['Image'];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name: $name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),

                          Text(
                            'Course: $course',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),

                          Text(
                            'Image:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),

                          // Display the image using the imageUrl
                          Image.network(
                            imageUrl,
                            height: 400.0,
                            width: 400.0,
                          ),
                        ],
                      );
                    } else {
                      return Text('No data found.');
                    }
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
