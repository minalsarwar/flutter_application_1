import 'package:flutter_application_1/core/network.dart';
import 'package:flutter_application_1/core/repository/user_repo.dart';
import 'package:flutter_application_1/models/user_model.dart';

class MockUserRepo implements UserRepository {
  @override
  Future<List<User>> _getUserMoc() {
    return Future.value([User()]);
  }

  @override
  Future<List<User>> _getUser() {
    return Future.value([User()]);
  }

  @override
  // TODO: implement userApiClient
  UserApiClient get userApiClient => throw UnimplementedError();

  @override
  Future<List<User>> getuser() {
    return Future.value([User()]);
  }
}
