import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EventFormPage(),
    );
  }
}

class _EventFormPage extends StatefulWidget {
  _EventFormPage() : super();

  @override
  _EventFormPageState createState() => _EventFormPageState();
}

class _EventFormPageState extends State<_EventFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: <Widget>[
        Expanded(child: Container(color: Color.fromRGBO(157, 232, 104, 1)), flex: 1),
        Expanded(child: Container(color: Colors.red),flex: 2,)
      ],),),
    );
  }
}
