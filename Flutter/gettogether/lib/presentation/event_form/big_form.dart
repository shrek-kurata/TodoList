import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BigForm {
  final String title;
  BigForm(this.title);

  Widget show() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[_text(this.title), _bigLabel],
      );

  Container _text(String title) => Container(
      child: Text(title, textAlign: TextAlign.center, style: _textStyle));

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

  static var _border = Border.all(
      color: Color.fromRGBO(230, 234, 234, 1),
      width: 2,
      style: BorderStyle.solid);

  static var _borderRadius = BorderRadius.circular(6.0);
}
