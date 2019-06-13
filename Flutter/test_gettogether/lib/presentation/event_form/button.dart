import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => RaisedButton(
        onPressed: () {},
        padding: _edgeInsets,
        color: _color,
        textColor: Colors.white,
        child: Center(child: _text),
        shape: _shapeBorder,
      );

  static var _edgeInsets = EdgeInsets.symmetric(vertical: 17, horizontal: 33.0);
  static var _color = Color.fromRGBO(157, 232, 104, 1);
  static var _text = Text('Gettogether!', style: _textStyle);
  static var _textStyle = TextStyle(
      fontFamily: 'Avenir',
      fontSize: 15,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w700);
  static var _shapeBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)));
}
