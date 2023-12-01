import 'package:flutter_application_1/core/network/api.dart';
import 'package:flutter_application_1/user/providers.dart';
import 'package:flutter_application_1/user/states/state.dart';
import 'package:riverpod/riverpod.dart';

//dependent sources
final userStateNotifierProvider = StateNotifierProvider(
    (ref) => UserStateNotifier(ref.watch(clientProvider)));

class UserStateNotifier extends StateNotifier<UserState> {
  final ApiClient apiClient;
  UserStateNotifier(this.apiClient) : super(UserState.initial());

  getUser() async {
    try {
      state = UserState.loading();
      var data = await apiClient.getUser();
      return state = UserState.success(data);
    } catch (e) {
      return state = UserState.error("$e");
    }
  }
}
