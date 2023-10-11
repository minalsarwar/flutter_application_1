import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PexelsImageGallery extends StatefulWidget {
  const PexelsImageGallery({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PexelsImageGalleryState createState() => _PexelsImageGalleryState();
}

class _PexelsImageGalleryState extends State<PexelsImageGallery> {
  final String apiKey =
      'jh76jHHZbmVnAyf9y9y4l9ishSe3mJuIGiixnBKQxZVbA22uacNDLGgS';
  List<dynamic> photos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final response = await http.get(
      Uri.parse('https://api.pexels.com/v1/search?query=moon&per_page=15'),
      headers: {'Authorization': apiKey},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        photos = data['photos'];
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pexels Image Gallery',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 164, 195, 193),
      ),
      body: Column(
        children: <Widget>[
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Featuring Moon',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: photos.length,
                    itemBuilder: (context, index) {
                      final photo = photos[index];
                      return Card(
                        child: ListTile(
                          title: Text(
                            photo['photographer'],
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Image.network(photo['src']['medium']),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
