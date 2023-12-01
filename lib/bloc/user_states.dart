import 'package:flutter_application_1/models/user_model.dart';

abstract class UserState {
  const UserState([List props = const []]) : super();
}

class UserEmpty extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> user;

  UserLoaded({required this.user}) : super([user]);
}

class UserError extends UserState {
  final String? errorMsg;
  UserError({this.errorMsg});
}
