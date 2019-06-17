import 'package:flutter/material.dart';
import 'package:gettogether/blocs/auth_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterBase',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutterbase'),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[LoginButton()],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final _bloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _bloc.authenticatedStream,
        builder: (context, snapshot) {
          bool isAuthenticated = snapshot.data as bool;
          if (isAuthenticated) {
            return MaterialButton(
              onPressed: () => _bloc.authEventSink.add(SignOutEvent()),
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Signout'),
            );
          } else {
            return MaterialButton(
              onPressed: () => _bloc.authEventSink.add(SignInEvent()),
              color: Colors.white,
              textColor: Colors.black,
              child: Text('Login with Google'),
            );
          }
        });
  }
}
