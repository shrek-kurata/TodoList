import 'package:flutter/cupertino.dart';
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
        body: Stack(children: <Widget>[
      SafeArea(
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
      Container(
        padding: EdgeInsets.only(top: 104, right: 24, left: 24, bottom: 256),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Text('一緒にスポーツする人を見つけよう',
                  style: TextStyle(
                      fontSize: 15, fontFamily: 'Hiragino Kaku Gothic ProN')),
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _bigForm('どのスポーツをしたい？'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      _smallForm('いつ遊ぶ？'),
                      _smallForm('どのくらい遊ぼうか？')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      _smallForm('何人で遊びたい？'),
                      _smallForm('予算はどのくらい？')
                    ],
                  ),
                  _bigForm('場所を教えて！')
                ],
              ),
            ),
          ],
        ),
      )
    ]));
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
