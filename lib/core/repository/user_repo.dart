import 'package:flutter_application_1/core/network.dart';
import 'package:flutter_application_1/models/user_model.dart';

class UserRepository {
  final UserApiClient userApiClient;

  UserRepository({required this.userApiClient});

  Future<List<User>> getuser() async {
    return userApiClient.fetchuser();
  }

  Future<List<User>> getUserMoc() async {
    return userApiClient.fetchUserMoc();
  }
}
