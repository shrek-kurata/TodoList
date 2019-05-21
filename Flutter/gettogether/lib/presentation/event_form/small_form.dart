import 'package:flutter/cupertino.dart';

class SmallForm {
  final List<String> titles;
  SmallForm(this.titles);

  Widget show() => Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[_smallForm(this.titles[0]), _smallForm(this.titles[1])],
    );
}


Widget _smallForm(String title) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            child: Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 10,
              fontFamily: 'font-family: Hiragino Kaku Gothic ProN',
              letterSpacing: 0.25),
        )),
        _smallLabel()
      ],
    );

Widget _smallLabel() => Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Color.fromRGBO(230, 234, 234, 1),
              width: 2,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(6.0)),
      width: 130,
      height: 45,
    );
