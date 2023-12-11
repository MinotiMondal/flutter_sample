import 'package:sample/blocs/app_event.dart';
import 'package:sample/blocs/app_states.dart';
import 'package:sample/repos/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
 final UserRepository _userRepository;

  UserBloc(this._userRepository):super(UserLoadingState()){
    on<LoadUserEvent>((event,emit) async{
          emit(UserLoadingState());
          print("You emitted the first state");
          emit(UserLoadingState());
          try{
            final users = await _userRepository.getUsers();
            emit(UserLoadedState(users));
          }catch(e){
            emit(UserErrorState(e.toString()));
          }
    });
  }
}