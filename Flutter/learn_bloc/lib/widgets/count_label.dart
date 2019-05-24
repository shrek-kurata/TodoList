import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountLabel extends StatefulWidget {
  final int favoriteCount;

  CountLabel({Key key, @required this.favoriteCount})
      : assert(favoriteCount > 0),
        super(key: key);

  @override
  _CountLabelState createState() {
    return _CountLabelState();
  }
}

class _CountLabelState extends State<CountLabel> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.favoriteCount.toString(),
      style: _textStyle,
    );
  }

  static var _textStyle = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 35.0, color: Colors.pink);
}
