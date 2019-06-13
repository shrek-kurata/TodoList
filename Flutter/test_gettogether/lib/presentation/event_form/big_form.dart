import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BigForm extends StatefulWidget {
  BigForm({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _BigFormState();
  }
}

class _BigFormState extends State<BigForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[_text(widget.title), _bigLabel],
    );
  }

  _text(String title) => Text(title, style: _textStyle);
  static var _textStyle = TextStyle(
      fontSize: 10,
      fontFamily: 'font-family: Hiragino Kaku Gothic ProN',
      letterSpacing: 0.25);

  static var _bigLabel = Container(
    decoration: _boxDecoration,
    width: 280,
    height: 50,
  );

  static var _boxDecoration =
      BoxDecoration(border: _border, borderRadius: _borderRadius);

  static var _border =
      Border.all(color: _borderColor, width: 2, style: BorderStyle.solid);

  static var _borderColor = Color.fromRGBO(230, 234, 234, 1);

  static var _borderRadius = BorderRadius.circular(6.0);
}
