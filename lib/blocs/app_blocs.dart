import 'package:sample/blocs/app_event.dart';
import 'package:sample/blocs/app_states.dart';
import 'package:sample/repository/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      switch (event) {
        case LoadUserEvent:
      }
      emit(UserLoadingState());

      emit(UserLoadingState());
      try {
        final users = await _userRepository.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
    on<GetUserData>((event, state) async {});
  }
}
