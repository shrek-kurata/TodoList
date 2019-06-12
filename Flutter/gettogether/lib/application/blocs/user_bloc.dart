import 'dart:async';

import 'package:gettogether/domain/user.dart';

class UserBloc {
  final _valueController = StreamController<User>();
  Stream<User> get value => _valueController.stream;

  void signUp(
    firebaseUserRepoitory = FireBaser
    const _user = 
  ) {}

  void signIn() {}

  void dispose() {
    _valueController.close();
  }
}
