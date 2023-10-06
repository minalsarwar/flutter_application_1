// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '/model/product.dart';
// import '/model/products_repository.dart';

// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   // TODO: Add text editing controllers (101)
//   // TODO: Make a collection of cards (102)
//   List<Card> _buildGridCards(List<String> apiResponse) {
//     if (apiResponse.isEmpty) {
//       return const <Card>[];
//     }

//     final ThemeData theme = Theme.of(context);

//     return apiResponse.map((text) {
//       return Card(
//         clipBehavior: Clip.antiAlias,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   text,
//                   style: theme.textTheme.titleLarge,
//                   maxLines: 5, // Adjust max lines as needed
//                   overflow: TextOverflow.ellipsis, // Handle overflowing text
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(
//             Icons.menu,
//             semanticLabel: 'menu',
//           ),
//           onPressed: () {
//             print('Menu button');
//           },
//         ),
//         title: const Text('SHRINE'),
//         backgroundColor: Color.fromARGB(255, 237, 233, 233),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(
//               Icons.search,
//               semanticLabel: 'search',
//             ),
//             onPressed: () {
//               print('Search button');
//             },
//           ),
//           IconButton(
//             icon: const Icon(
//               Icons.tune,
//               semanticLabel: 'filter',
//             ),
//             onPressed: () {
//               print('Filter button');
//             },
//           ),
//         ],
//       ),
//       body: GridView.count(
//         crossAxisCount: 2,
//         padding: const EdgeInsets.all(16.0),
//         childAspectRatio: 8.0 / 9.0,
//         children: _buildGridCards(context),
//         //  TODO: Build a grid of cards (102)
//         // children: <Widget>[
//         //   Card(
//         //     clipBehavior: Clip.antiAlias,
//         //     child: Column(
//         //       crossAxisAlignment: CrossAxisAlignment.start,
//         //       children: <Widget>[
//         //         AspectRatio(
//         //           aspectRatio: 18.0 / 11.0,
//         //           child: Image.asset('android/assets/stars.png'),
//         //         ),
//         //         const Padding(
//         //           padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
//         //           child: Column(
//         //             crossAxisAlignment: CrossAxisAlignment.start,
//         //             children: <Widget>[
//         //               Text('Title'),
//         //               SizedBox(height: 8.0),
//         //               Text('Secondary Text'),
//         //             ],
//         //           ),
//         //         ),
//         //       ],
//         //     ),
//         //   )
//         // ]
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import '/model/product.dart';
import '/model/products_repository.dart';
import '/networking/list_api.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('Menu button');
          },
        ),
        title: const Text('SHRINE'),
        backgroundColor: Color.fromARGB(255, 237, 233, 233),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Users>>(
          future: fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text("Error");
            } else if (!snapshot.hasData) {
              return const Text("No data available");
            }

            List<Users> usersList = snapshot.data!;

            return GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16.0),
              childAspectRatio: 8.0 / 9.0,
              children: _buildGridCards(context, usersList),
            );
          },
        ),
      ),
    );
  }

  List<Card> _buildGridCards(BuildContext context, List<Users> usersList) {
    final ThemeData theme = Theme.of(context);

    // Define the image asset here
    final Widget imageAsset = Image.asset(
      'android/assets/logo.png', // Replace with your image asset path
      fit: BoxFit.cover, // Adjust the fit as needed
    );

    return usersList.map((user) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11, // Adjust the aspect ratio as needed
              child: imageAsset, // Use the image asset widget here
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  user.title,
                  style: theme.textTheme.titleLarge,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
