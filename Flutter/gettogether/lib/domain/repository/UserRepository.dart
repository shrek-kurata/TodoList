import 'package:gettogether/domain/user.dart';

abstract class UserRepository {
  Future<User> save(User user) {}
  Future<User> logIn() {}
  Future destroy();
}
