import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class StudentsForm extends StatefulWidget {
  const StudentsForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StudentsFormState createState() => _StudentsFormState();
}

class _StudentsFormState extends State<StudentsForm> {
  Color getRandomColor() {
    List<Color> pastelColors = [
      Color(0xFFE6E6FA), // Lavender
      Color(0xFFF5E1B3), // Light Olive
    ];

    Random random = Random();
    return pastelColors[random.nextInt(pastelColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Students',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('students').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                var students = snapshot.data?.docs;

                return ListView.builder(
                  itemCount: students?.length,
                  itemBuilder: (context, index) {
                    var student = students?[index].data();
                    var name = student?['Name'];
                    var erp = student?['Erp'];
                    var age = student?['Age'];
                    var course = student?['Course'];
                    var program = student?['Program'];
                    var imageUrl = student?['Image'];

                    // if (program == null) {
                    //   print('Program is null for student: $student');
                    // }

                    return Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      shadowColor: Colors.black,
                      color: getRandomColor(),
                      child: Container(
                        height: 350.0,
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: $name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            Text('ERP: $erp'),
                            Text('Age: $age'),
                            Text('Course: $course'),
                            Text('Program: $program'),
                            Center(
                              child: Image.network(
                                imageUrl,
                                height: 200.0,
                                width: 200.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Text('No students found.');
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
