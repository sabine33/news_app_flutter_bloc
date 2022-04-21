import '../../models/user_model.dart';

class UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<User> users;

  UserLoadedState(this.users);
}

class UserEmptyState extends UserState {}

class UserLoadingErrorState extends UserState {
  final String message;

  UserLoadingErrorState(this.message);
}
