// import 'package:flutter/material.dart';

// class TileDataModel {
//   TileDataModel({required this.subTitle, required this.title});
//   final String title;
//   final String subTitle;
// }

// var _data = [
//   TileDataModel(subTitle: "This is my first tile ever", title: 'Tile #1'),
//   TileDataModel(subTitle: "This is my second tile", title: 'Tile #2'),
//   TileDataModel(subTitle: "This is my third tile", title: 'Tile #3')
// ];

// class ListViewCustom extends StatelessWidget {
//   const ListViewCustom({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal[400],
//         title: const Text('Welcome to Amal App!'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: ListView.builder(
//           itemCount: _data.length,
//           itemBuilder: (BuildContext context, int i) {
//             var obj = _data[i];
//             return _item(obj);
//           },
//         ),
//       ),
//     );
//   }
// }

// Widget _item(TileDataModel obj) {
//   return Column(
//     children: [
//       Card(
//         child: ListTile(
//           leading: Icon(Icons.person, color: Colors.black),
//           title: Text(obj.title),
//           subtitle: Text(obj.subTitle),
//           tileColor: Color.fromARGB(255, 245, 242, 241),
//         ),
//       ),
//     ],
//   );
// }

// // Widget _item(TileDataModel obj){
// //     return Column(
// //             child: ListTile(
// //               leading:
// //                   Icon(Icons.person, color: Colors.black), // Icon on the left
// //               title: Text('Title'),
// //               subtitle: Text(
// //                   'This is the first list tile I have made in flutter! I am excited to learn more about list tiles.'),
// //               tileColor: Color.fromARGB(255, 245, 242, 241),
// //             ),
// //           ),
// //           Card(
// //             child: ListTile(
// //               leading:
// //                   Icon(Icons.person, color: Colors.black), // Icon on the left
// //               title: Text('Title'),
// //               subtitle: Text(
// //                   'This is the second list tile I have made in flutter! I am excited to learn more about list tiles.'),
// //               tileColor: Color.fromARGB(255, 245, 242, 241),
// //             ),
// //           ),
// //           Card(
// //             child: ListTile(
// //               leading:
// //                   Icon(Icons.person, color: Colors.black), // Icon on the left
// //               title: Text('Title'),
// //               subtitle: Text(
// //                   'This is the third list tile I have made in flutter! I am excited to learn more about list tiles.'),
// //               tileColor: Color.fromARGB(255, 245, 242, 241),
// //             ),
// //           ),
// // }

////////////AMAL APP USING LIST VIEW//////
// import 'package:flutter/material.dart';

// class TileDataModel {
//   TileDataModel({
//     required this.subTitle,
//     required this.title,
//     required this.icon,
//     required this.color,
//   });

//   final String title;
//   final String subTitle;
//   final IconData icon;
//   final Color color;
// }

// var _data = [
//   TileDataModel(
//     subTitle: "Refuse",
//     title: 'انکار',
//     icon: Icons.shopping_bag,
//     color: Colors.purple,
//   ),
//   TileDataModel(
//     subTitle: "Reduce",
//     title: 'کم کریں',
//     icon: Icons.wb_sunny,
//     color: Colors.pink,
//   ),
//   TileDataModel(
//     subTitle: "Regift",
//     title: 'تحفہ دوبارہ دینا',
//     icon: Icons.card_giftcard,
//     color: Colors.orange,
//   ),
//   TileDataModel(
//     subTitle: "Reuse",
//     title: 'دوبارہ استعمال کریں',
//     icon: Icons.local_drink,
//     color: Colors.blue,
//   ),
//   TileDataModel(
//     subTitle: "Recycle",
//     title: 'دوبارہ ری سائیکل',
//     icon: Icons.cached,
//     color: Color.fromARGB(255, 207, 207, 14),
//   ),
//   TileDataModel(
//     subTitle: "Replant",
//     title: 'دوبارہ درخت لگائیں',
//     icon: Icons.emoji_nature,
//     color: Colors.green,
//   ),
//   TileDataModel(
//     subTitle: "Report",
//     title: 'رپورٹ کریں',
//     icon: Icons.warning,
//     color: Colors.red,
//   ),
// ];

// class ListViewCustom extends StatelessWidget {
//   const ListViewCustom({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal[400],
//         title: const Text('Welcome to Amal App!'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: ListView.builder(
//           itemCount: _data.length,
//           itemBuilder: (BuildContext context, int i) {
//             var obj = _data[i];
//             return _item(obj);
//           },
//         ),
//       ),
//     );
//   }
// }

// Widget _item(TileDataModel obj) {
//   return Column(
//     children: [
//       Card(
//         color: obj.color,
//         child: ListTile(
//           leading: Icon(obj.icon, color: Colors.white),
//           title: Text(obj.subTitle, style: TextStyle(color: Colors.white)),
//           subtitle: Text(obj.title, style: TextStyle(color: Colors.white)),
//         ),
//       ),
//     ],
//   );
// }

//////AMAL APP USING GRID VIEW//////
import 'package:flutter/material.dart';

class TileDataModel {
  TileDataModel({
    required this.subTitle,
    required this.title,
    required this.icon,
    required this.color,
  });

  final String title;
  final String subTitle;
  final IconData icon;
  final Color color;
}

var _data = [
  TileDataModel(
    subTitle: "Refuse",
    title: 'انکار',
    icon: Icons.shopping_bag,
    color: Colors.purple,
  ),
  TileDataModel(
    subTitle: "Reduce",
    title: 'کم کریں',
    icon: Icons.wb_sunny,
    color: Colors.pink,
  ),
  TileDataModel(
    subTitle: "Regift",
    title: 'تحفہ دوبارہ دینا',
    icon: Icons.card_giftcard,
    color: Colors.orange,
  ),
  TileDataModel(
    subTitle: "Reuse",
    title: 'دوبارہ استعمال کریں',
    icon: Icons.local_drink,
    color: Colors.blue,
  ),
  TileDataModel(
    subTitle: "Recycle",
    title: 'دوبارہ ری سائیکل',
    icon: Icons.cached,
    color: Color.fromARGB(255, 207, 207, 14),
  ),
  TileDataModel(
    subTitle: "Replant",
    title: 'دوبارہ درخت لگائیں',
    icon: Icons.emoji_nature,
    color: Colors.green,
  ),
  TileDataModel(
    subTitle: "Report",
    title: 'رپورٹ کریں',
    icon: Icons.warning,
    color: Colors.red,
  ),
];

class ListViewCustom extends StatelessWidget {
  const ListViewCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 218, 243, 240), // Change the color as needed
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, // Adjust alignment as needed
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Add functionality for the home button
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Add functionality for the search button
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                // Add functionality for the favorite button
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Add functionality for the profile button
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 218, 243, 240),
        // leading: Center(
        //   child: Image.network(
        //     'https://play-lh.googleusercontent.com/UAr1vqh5eCvfXUxtmeZhg_Hmn8X5ZJ3UatxRuVrMQt8u3cY84G5q5iLho4I6UTiAUis', // Replace with the URL of your online logo
        //     width: 40.0,
        //     height: 40.0,
        //   ),
        // ),
        leading: Builder(
          builder: (context) => // Ensure Scaffold is in context
              IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer()),
        ),
        // actions: [
        //   Builder(builder: (context) {
        //     return IconButton(
        //       icon: const Icon(Icons.menu),
        //       onPressed: () {
        //         // print('hi minal');
        //         Scaffold.of(context).openDrawer();
        //       },
        //     );
        //   }),
        // ],
        title: const Text(
          'Welcome to Amal App!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontStyle: FontStyle.normal,
            color: Color.fromARGB(255, 41, 118, 148),
            shadows: [
              Shadow(
                color: Color.fromARGB(255, 103, 199, 103),
                offset: Offset(2, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.network(
              'https://play-lh.googleusercontent.com/UAr1vqh5eCvfXUxtmeZhg_Hmn8X5ZJ3UatxRuVrMQt8u3cY84G5q5iLho4I6UTiAUis',
              width: 40.0,
              height: 40.0,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer header with your logo or other content
            DrawerHeader(
              // Your logo or header content can go here
              child: Image.network(
                'https://icon-library.com/images/female-user-icon/female-user-icon-8.jpg',
                width: 10.0,
                height: 10.0,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle the Home option tap
                // Navigator.pop(context); // Closes the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Update Profile'),
              onTap: () {
                // Handle the Update Profile option tap
                // Navigator.pop(context); // Closes the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Report a Problem'),
              onTap: () {
                // Handle the Report a Problem option tap
                // Navigator.pop(context); // Closes the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Wallet'),
              onTap: () {
                // Handle the Wallet option tap
                // Navigator.pop(context); // Closes the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('Amal Marketplace'),
              onTap: () {
                // Handle the Amal Marketplace option tap
                // Navigator.pop(context); // Closes the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Invite a Friend'),
              onTap: () {
                // Handle the Invite a Friend option tap
                // Navigator.pop(context); // Closes the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Handle the Logout option tap
                // Navigator.pop(context); // Closes the drawer
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32.0),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: 'Are you ready for an ',
                  ),
                  TextSpan(
                    text: 'Amal',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '?',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 16.0),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: 'کیا آپ ',
                  ),
                  TextSpan(
                    text: 'امل',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' کے لیے تیار ہیں؟',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 tiles per row
              ),
              itemCount: _data.length,
              itemBuilder: (BuildContext context, int i) {
                var obj = _data[i];
                // if (i == _data.length - 1) {
                //   return Center(child: _item(obj));
                // }
                return _item(obj);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _item(TileDataModel obj) {
  return Card(
    color: obj.color,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(obj.icon, color: Colors.white),
        Text(obj.subTitle, style: const TextStyle(color: Colors.white)),
        Text(obj.title, style: const TextStyle(color: Colors.white)),
      ],
    ),
  );
}
