// import 'package:freezed_annotation/freezed_annotation.dart';

// @freezed
// abstract class UserState with _$UserState {
//   const factory UserState.initial() = _UserInitial;
//   const factory UserState.loading() = _UserLoading;
//   const factory UserState.success(User user) = _UserLoadedSuccess;
//   factory UserState.error([String message]) = _UserLoadedError;
// }

import 'package:flutter_application_1/core/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState.initial() = _UserInitial;
  const factory UserState.loading() = _UserLoading;
  const factory UserState.success(User user) = _UserLoadedSuccess;
  factory UserState.error(String s,
      {@Default('Default error message') String message}) = _UserLoadedError;
}
