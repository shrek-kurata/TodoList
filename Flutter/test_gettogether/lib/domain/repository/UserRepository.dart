import 'package:gettogether/domain/user.dart';

abstract class UserRepository {
  Future<User> signUpWithGoogle() {}
  Future<User> signInWithGoogle() {}
}
