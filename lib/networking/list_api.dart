// //Json model class
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// Future<dynamic> fetchAlbum() async {
//   final response =
//       await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

//   // if (response.statusCode == 200)
// }

// class Users {
//   final int userId;
//   final int id;
//   final String title;

//   const Users({
//     required this.userId,
//     required this.id,
//     required this.title,
//   });

//   factory Users.fromJson(Map<String, dynamic> json) {
//     return Users(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }

// // void main() => runApp(const MyWidget());

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     // late Future<List<Users>> futureAlbum;
//     // return const Placeholder();
//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: const Text('I am a stateful widget, learning apis'),
//     //     backgroundColor: Colors.amber,
//     //   ),
//     // );

//     @override
//     void initState() {
//       super.initState();
//       // futureAlbum();
//     }
//   }
// }

//////MARYAM
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Users {
  final int userId;
  final int id;
  final String title;

  const Users({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(userId: json['userId'], id: json['id'], title: json['title']);
  }
}

class StfWidget extends StatefulWidget {
  const StfWidget({super.key});

  @override
  State<StfWidget> createState() => _StfWidgetState();
}

class _StfWidgetState extends State<StfWidget> {
  // late Future<List<Users>> fetchUsers;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Buttons'),
          centerTitle: true,
        ),
        body: Center(
            child: FutureBuilder<List<Users>>(
                future: fetchUsers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (contxt, i) {
                          var item = snapshot.data![i];
                          return Text(item.title);
                        });
                  } else if (snapshot.hasError) {
                    return const Text("Error");
                  }

                  return const CircularProgressIndicator();
                })));
  }
}

Future<List<Users>> fetchUsers() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

  print(response.body.toString());

  if (response.statusCode == 200) {
    List<dynamic> _parsedListJson = jsonDecode(response.body);

    List<Users> _itemsList = List<Users>.from(
        _parsedListJson.map<Users>((dynamic i) => Users.fromJson(i)));

    return _itemsList;
  } else {
    throw Exception('Failed to load Users');
  }
}

//gptt
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class JokeOfTheDayViewer extends StatefulWidget {
//   const JokeOfTheDayViewer({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _JokeOfTheDayViewerState createState() => _JokeOfTheDayViewerState();
// }

// class _JokeOfTheDayViewerState extends State<JokeOfTheDayViewer> {
//   late Future<JokeData> _futureJokeData;

//   @override
//   void initState() {
//     super.initState();
//     _futureJokeData = fetchJokeData();
//   }

//   Future<JokeData> fetchJokeData() async {
//     final response = await http.get(Uri.parse('https://your-api-url-here'));

//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       return JokeData.fromJson(jsonData);
//     } else {
//       throw Exception('Failed to load joke data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Joke of the Day!',
//           style: TextStyle(
//             color: Colors.white, // Set the text color to white
//           ),
//         ),
//         backgroundColor: Colors.green, // Set the app bar background color
//       ),
//       body: Center(
//         child: FutureBuilder<JokeData>(
//           future: _futureJokeData,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               final jokeData = snapshot.data!;
//               return Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Category: ${jokeData.category}',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontStyle: FontStyle.italic,
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       jokeData.setup,
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(jokeData.delivery),
//                   ],
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// class JokeData {
//   final String category;
//   final String setup;
//   final String delivery;

//   JokeData({
//     required this.category,
//     required this.setup,
//     required this.delivery,
//   });

//   factory JokeData.fromJson(Map<String, dynamic> json) {
//     return JokeData(
//       category: json['category'],
//       setup: json['setup'],
//       delivery: json['delivery'],
//     );
//   }
// }
