import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventFormPage extends StatefulWidget {
  EventFormPage() : super();

  @override
  _EventFormPageState createState() => _EventFormPageState();
}

class _EventFormPageState extends State<EventFormPage> {
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
