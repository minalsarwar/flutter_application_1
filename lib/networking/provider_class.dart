import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/networking/practice.dart';
import 'package:http/http.dart' as http;

class DataClass extends ChangeNotifier {
  List<APIDataModel>? post;
  bool loading = false;

  getPostData() async {
    loading = true;
    post = (await fetchProducts());
    loading = false;

    notifyListeners();
  }

  Future<List<APIDataModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      List<APIDataModel> products = jsonData
          .map((productJson) => APIDataModel.fromJson(productJson))
          .toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
