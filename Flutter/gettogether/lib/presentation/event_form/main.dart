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
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Container(color: Color.fromRGBO(157, 232, 104, 1)),
                  flex: 1),
              Expanded(
                child: Container(color: Colors.white),
                flex: 2,
              )
            ],
          ),
        ),
        Center(child: EventForm().view())
      ],
      fit: StackFit.expand,
    ));
  }
}
