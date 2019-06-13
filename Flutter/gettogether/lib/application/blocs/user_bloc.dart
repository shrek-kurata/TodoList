import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gettogether/domain/user.dart';
import 'package:gettogether/infrastructure/FirebaseUserRepository.dart';
import 'package:gettogether/presentation/event_form/main.dart';

class UserBloc {
  final _valueController = StreamController<User>();
  Stream<User> get value => _valueController.stream;

  var _firebaseUserRepository = FirebaseUserRepository();
  Future<User> signUp() async {
    var _user = await _firebaseUserRepository.signUpWithGoogle();
    _valueController.sink.add(_user);
    return _user;
  }

  void signIn() async {
    var _user = await _firebaseUserRepository.signInWithGoogle();
    _valueController.sink.add(_user);
  }

  void dispose() {
    _valueController.close();
  }
}
