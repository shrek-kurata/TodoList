import 'dart:async';

import 'package:gettogether/domain/user.dart';
import 'package:gettogether/infrastructure/FirebaseUserRepository.dart';

class UserBloc {
  final _valueController = StreamController<User>();
  Stream<User> get value => _valueController.stream;

  var _firebaseUserRepository = FirebaseUserRepository();

  void signUp() async {
    var _user = await _firebaseUserRepository.signUpWithGoogle();
    _valueController.sink.add(_user);
  }

  void signIn() async {
    var _user = await _firebaseUserRepository.signInWithGoogle();
    _valueController.sink.add(_user);
  }

  void dispose() {
    _valueController.close();
  }
}
