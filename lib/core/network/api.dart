import 'package:flutter_application_1/core/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  final http.Client _client;

  ApiClient(this._client);

  Future<User> getUser() async {
    final http.Response response =
        await _client.get("https://jsonplaceholder.typicode.com/users" as Uri);
    final parsed = jsonDecode(response.body)[0];
    final user = User.fromJson(parsed);
    return user;
  }
}
