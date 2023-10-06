import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CommentsViewer extends StatefulWidget {
  const CommentsViewer({Key? key});

  @override
  _CommentsViewerState createState() => _CommentsViewerState();
}

class _CommentsViewerState extends State<CommentsViewer> {
  late Future<List<Comment>> _futureComments;

  @override
  void initState() {
    super.initState();
    _futureComments = fetchComments();
  }

  Future<List<Comment>> fetchComments() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      List<Comment> comments =
          jsonData.map((commentJson) => Comment.fromJson(commentJson)).toList();
      return comments;
    } else {
      throw Exception('Failed to load comments');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comments',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: FutureBuilder<List<Comment>>(
        future: _futureComments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading...'),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No comments available.'));
          } else {
            List<Comment> comments = snapshot.data!;
            return ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 1,
                  margin: const EdgeInsets.all(2), // Add margin for spacing
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        (index + 1).toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    title: Text(comments[index].name),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 300,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name: ${comments[index].name}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Email: ${comments[index].email}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Body: ${comments[index].body}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Comment {
  final String name;
  final String email;
  final String body;

  Comment({
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}

// trying scrollable
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class CommentsViewer extends StatefulWidget {
//   const CommentsViewer({Key? key});

//   @override
//   _CommentsViewerState createState() => _CommentsViewerState();
// }

// class _CommentsViewerState extends State<CommentsViewer> {
//   late Future<List<Comment>> _futureComments;

//   @override
//   void initState() {
//     super.initState();
//     _futureComments = fetchComments();
//   }

//   Future<List<Comment>> fetchComments() async {
//     final response = await http
//         .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

//     if (response.statusCode == 200) {
//       final List<dynamic> jsonData = json.decode(response.body);
//       List<Comment> comments =
//           jsonData.map((commentJson) => Comment.fromJson(commentJson)).toList();
//       return comments;
//     } else {
//       throw Exception('Failed to load comments');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Comments',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.blue,
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<Comment>>(
//         future: _futureComments,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(),
//                   SizedBox(height: 16),
//                   Text('Loading...'),
//                 ],
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No comments available.'));
//           } else {
//             List<Comment> comments = snapshot.data!;
//             return SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   ListView.builder(
//                     itemCount: comments.length,
//                     shrinkWrap: true,
//                     physics:
//                         NeverScrollableScrollPhysics(), // Disable scrolling
//                     itemBuilder: (context, index) {
//                       return Card(
//                         elevation: 1,
//                         margin: const EdgeInsets.all(2),
//                         child: ListTile(
//                           leading: CircleAvatar(
//                             backgroundColor: Colors.blue,
//                             child: Text(
//                               (index + 1).toString(),
//                               style: const TextStyle(
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           title: Text(comments[index].name),
//                           onTap: () {
//                             showModalBottomSheet(
//                               context: context,
//                               builder: (context) {
//                                 return Container(
//                                   height: 300,
//                                   padding: const EdgeInsets.all(16),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'Name: ${comments[index].name}',
//                                         style: const TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       Text(
//                                         'Email: ${comments[index].email}',
//                                         style: const TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       Text(
//                                         'Body: ${comments[index].body}',
//                                         style: const TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class Comment {
//   final String name;
//   final String email;
//   final String body;

//   Comment({
//     required this.name,
//     required this.email,
//     required this.body,
//   });

//   factory Comment.fromJson(Map<String, dynamic> json) {
//     return Comment(
//       name: json['name'],
//       email: json['email'],
//       body: json['body'],
//     );
//   }
// }