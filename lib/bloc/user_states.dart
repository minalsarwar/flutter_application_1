// import 'package:flutter_application_1/models/user_model.dart';

// abstract class UserState {
//   const UserState([List props = const []]) : super();
// }

// class UserEmpty extends UserState {}

// class UserLoading extends UserState {}

// class UserLoaded extends UserState {
//   final List<User> user;

//   UserLoaded({required this.user}) : super([user]);
// }

// class UserError extends UserState {
//   final String? errorMsg;
//   UserError({this.errorMsg});
// }

import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/user_model.dart';

abstract class UserState extends Equatable {
  const UserState([List props = const []]) : super();
}

class UserEmpty extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

// class UserLoaded extends UserState {
//   final List<User> user;

//   UserLoaded({required this.user}) : super([user]);

//   @override
//   List<Object?> get props => [user];
// }

class UserLoaded extends UserState {
  final List<User> user;

  UserLoaded({required this.user}) : super([user]);

  @override
  List<Object?> get props => [user];
}

class UserError extends UserState {
  final String? errorMsg;
  UserError({this.errorMsg});

  @override
  List<Object?> get props => [errorMsg];
}
