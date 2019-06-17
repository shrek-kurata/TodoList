import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:gettogether/models/user.dart';
import 'package:gettogether/services/auth.dart';

abstract class AuthEvent {}

class SignInEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}

class AuthBloc {
  /// Userの状態管理
  StreamController<User> _userController = StreamController<User>();
  StreamController<bool> _authenticatedController = StreamController<bool>();

  /// Eventの状態管理
  final _eventController = StreamController<AuthEvent>();

  /// CQRSの考え方
  Sink<AuthEvent> get authEventSink => _eventController.sink;

  /// クラスの中に閉じ込めてても良い
  /// UserBloc作って分離できる
  StreamSink<User> get _userSink => _userController.sink;
  Stream<User> get userStream => _userController.stream;

  StreamSink<bool> get _authenticatedSink => _authenticatedController.sink;
  Stream<bool> get authenticatedStream => _authenticatedController.stream;

  /// 初期化と同時にeventはlisten状態
  AuthBloc() {
    /// _authの状態を監視
    _eventController.stream.listen(_auth);
  }

  /// authがactionとreducer的な役割
  _auth(AuthEvent event) async {
    if (event is SignInEvent) {
      FirebaseUser user = await authService.googleSignIn();
      _userSink.add(User(name: user.displayName));
      _authenticatedSink.add(true);
    } else if (event is SignOutEvent) {
      await authService.signOut();
      _userSink.add(User());
      _authenticatedSink.add(false);
    }
  }

  dispose() {
    _eventController.close();
    _userController.close();
    _authenticatedController.close();
  }
}
