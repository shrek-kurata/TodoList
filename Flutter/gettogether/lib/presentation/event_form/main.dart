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


  Widget _bigLabel() => Container(
        decoration: BoxDecoration(
            border: Border.all(
                style: BorderStyle.solid,
                color: Color.fromRGBO(230, 234, 234, 0)),
            borderRadius: BorderRadius.circular(6.0)),
        width: 280,
        height: 50,
      );

  Widget _smallLabel() => Container(
        decoration: BoxDecoration(
            border: Border.all(
                style: BorderStyle.none,
                color: Color.fromRGBO(230, 234, 234, 0)),
            borderRadius: BorderRadius.circular(6.0)),
        width: 130,
        height: 45,
      );

  Widget _bigForm(String title) => Column(
        children: <Widget>[
          Container(
            color: Colors.black,
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: 'Hiragino Kaku Gothic ProN',
                  fontSize: 10,
                  color: Color.fromRGBO(30, 36, 36, 0)),
            ),
          ),
          _bigLabel()
        ],
      );

  Widget _smallForm(String title) => Column(children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: TextStyle(
                fontFamily: 'Hiragino Kaku Gothic ProN',
                fontSize: 10,
                color: Color.fromRGBO(30, 36, 36, 0)),
          ),
        ),
        _smallLabel()
      ]);
}
