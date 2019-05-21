import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gettogether/presentation/event_form/form.dart';

class EventFormPage extends StatefulWidget {
  EventFormPage() : super();

  @override
  _EventFormPageState createState() => _EventFormPageState();
}

class _EventFormPageState extends State<EventFormPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: Stack(
        children: <Widget>[_backGround, Center(child: EventForm().view())],
        fit: StackFit.expand,
      ));

  static var _backGround = Container(
    child: Column(
      children: <Widget>[
        Expanded(child: Container(color: _bgButtomColor), flex: 1),
        Expanded(
          child: Container(color: Colors.white),
          flex: 2,
        )
      ],
    ),
  );

  static var _bgButtomColor = Color.fromRGBO(157, 232, 104, 1);
}
