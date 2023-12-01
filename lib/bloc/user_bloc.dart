import 'package:flutter_application_1/bloc/user_event.dart';
import 'package:flutter_application_1/bloc/user_states.dart';
import 'package:flutter_application_1/core/repository/user_repo.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserLoading()) {
    on<FetchUser>((event, emit) async {
      await _getUser(emit);
    });
    on<FetchUserMoc>((event, emit) async {
      await _getUserMoc(emit);
    });
  }

  Future<void> _getUser(Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final List<User> user = await userRepository.getuser();
      emit(UserLoaded(user: user));
    } catch (e) {
      emit(UserError(errorMsg: e.toString()));
    }
  }

  Future<void> _getUserMoc(Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final List<User> user = await userRepository.getUserMoc();
      emit(UserLoaded(user: user));
    } catch (e) {
      emit(UserError(errorMsg: e.toString()));
    }
  }
}
