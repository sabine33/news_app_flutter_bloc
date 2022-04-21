import '../data/mock_users.dart';

class UserApi {
  Future<List<Map<String, dynamic>>> getUsers() async {
    await Future.delayed(const Duration(seconds: 1));
    return usersList;
  }
}
