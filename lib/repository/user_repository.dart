import '../api/users_api.dart';
import '../models/user_model.dart';

class UserRepository {
  UserApi userApi;
  UserRepository({required this.userApi});

  Future<List<User>> getUsersFromApi() async {
    var users = await userApi.getUsers();
    var usersList = users.map((e) => User.fromJson(e)).toList();
    return usersList;
  }
}
