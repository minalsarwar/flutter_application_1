import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_application_1/bloc/user_bloc.dart';
import 'package:flutter_application_1/bloc/user_event.dart';
import 'package:flutter_application_1/bloc/user_states.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'user_repo_moc.dart';

void main() {
  group('Search repo bloc test', () {
    late UserBloc mocBloc;
    late MockUserRepo mockUserRepo;
    setUpAll(() {
      mockUserRepo = MockUserRepo();
      mocBloc = UserBloc(userRepository: mockUserRepo);
    });

    blocTest('emit [UserLoading ,UserLoaded] ',
        build: () => mocBloc,
        act: (bloc) => bloc.add(const FetchUser()),
        expect: (() => [
              UserLoading(),
              UserLoaded(user: [User()])
            ]));
//     blocTest(
//   'emit [UserLoading, UserLoaded]',
//   build: () => mocBloc,
//   act: (bloc) => bloc.add(const FetchUser()),
//   expect: () => [
//     emitsInOrder([UserLoading(), UserLoaded(user: [User()])]),
//   ],
// );

    // tearDown(() {
    //   mocBloc.close();
    // });
  });
}
