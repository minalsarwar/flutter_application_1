import 'package:flutter/material.dart';

class MyListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Example'),
      ),
      body: MyListView(),
    );
  }
}

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MyListTile(title: 'Item 1', subtitle: 'Subtitle 1'),
        MyListTile(title: 'Item 2', subtitle: 'Subtitle 2'),
        MyListTile(title: 'Item 3', subtitle: 'Subtitle 3'),
      ],
    );
  }
}

class MyListTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const MyListTile({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        // You can add more customization to the ListTile here
      ),
    );
  }
}
