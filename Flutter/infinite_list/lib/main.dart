import 'package:flutter/material.dart';
import 'package:infinite_list/bloc/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:infinite_list/presentation/page/home.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter infinite scroll',
      home: Scaffold(appBar: AppBar(title: Text('Posts')), body: HomePage()),
    );
  }
}