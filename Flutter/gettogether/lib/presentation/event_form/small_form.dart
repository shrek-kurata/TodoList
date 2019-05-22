import 'package:flutter/cupertino.dart';

class SmallForm extends StatefulWidget {
  SmallForm({Key key, this.titles}) : super(key: key);
  final List<String> titles;

  @override
  State<SmallForm> createState() => _SmallFormState();
}

class _SmallFormState extends State<SmallForm> {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _smallForm(widget.titles[0]),
          _smallForm(widget.titles[1])
        ],
      );

  static _smallForm(String title) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[Container(child: _text(title)), _smallLabel()],
      );

  static _text(String title) => Text(
        title,
        textAlign: TextAlign.start,
        style: _textStyle,
      );

  static var _textStyle = TextStyle(
      fontSize: 10,
      fontFamily: 'font-family: Hiragino Kaku Gothic ProN',
      letterSpacing: 0.25);

  static _smallLabel() => Container(
        decoration: _boxDecoration(),
        width: 130,
        height: 45,
      );

  static _boxDecoration() =>
      BoxDecoration(border: _border, borderRadius: _borderRadius);
  static var _border = Border.all(
      color: Color.fromRGBO(230, 234, 234, 1),
      width: 2,
      style: BorderStyle.solid);
  static var _borderRadius = BorderRadius.circular(6.0);
}
