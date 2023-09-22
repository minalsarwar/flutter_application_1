import 'package:flutter/material.dart';

class TileDataModel {
  TileDataModel({required this.subTitle, required this.title});
  final String title;
  final String subTitle;
}

var _data = [
  TileDataModel(subTitle: "This is my first tile ever", title: 'Tile #1'),
  TileDataModel(subTitle: "This is my second tile", title: 'Tile #2'),
  TileDataModel(subTitle: "This is my third tile", title: 'Tile #3')
];

class ListViewCustom extends StatelessWidget {
  const ListViewCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: const Text('List Tile Example'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int i) {
            var obj = _data[i];
            return _item(obj);
          },
        ),
      ),
    );
  }
}

Widget _item(TileDataModel obj) {
  return Column(
    children: [
      Card(
        child: ListTile(
          leading: Icon(Icons.person, color: Colors.black),
          title: Text(obj.title),
          subtitle: Text(obj.subTitle),
          tileColor: Color.fromARGB(255, 245, 242, 241),
        ),
      ),
    ],
  );
}


// Widget _item(TileDataModel obj){
//     return Column(
//             child: ListTile(
//               leading:
//                   Icon(Icons.person, color: Colors.black), // Icon on the left
//               title: Text('Title'),
//               subtitle: Text(
//                   'This is the first list tile I have made in flutter! I am excited to learn more about list tiles.'),
//               tileColor: Color.fromARGB(255, 245, 242, 241),
//             ),
//           ),
//           Card(
//             child: ListTile(
//               leading:
//                   Icon(Icons.person, color: Colors.black), // Icon on the left
//               title: Text('Title'),
//               subtitle: Text(
//                   'This is the second list tile I have made in flutter! I am excited to learn more about list tiles.'),
//               tileColor: Color.fromARGB(255, 245, 242, 241),
//             ),
//           ),
//           Card(
//             child: ListTile(
//               leading:
//                   Icon(Icons.person, color: Colors.black), // Icon on the left
//               title: Text('Title'),
//               subtitle: Text(
//                   'This is the third list tile I have made in flutter! I am excited to learn more about list tiles.'),
//               tileColor: Color.fromARGB(255, 245, 242, 241),
//             ),
//           ),
// }






