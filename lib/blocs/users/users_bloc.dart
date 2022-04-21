import 'package:bloc/bloc.dart';

import '../../repository/user_repository.dart';
import 'user_events.dart';
import 'users_states.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserEmptyState()) {
    on<LoadUserEvent>((event, emit) async {
      try {
        emit(UserLoadingState());
        var users = await userRepository.getUsersFromApi();
        emit(UserLoadedState(users));
      } catch (ex) {
        emit(UserLoadingErrorState("Unable to load weather"));
      }
    });
  }
}
