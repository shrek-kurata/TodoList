import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventForm {
  Widget view() => Container(
      width: 330,
      height: 430,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), color: Colors.white),
      child: _itemContainer());

  Widget _itemContainer() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _bigForm('どのスポーツをしたい？'),
          _smallFormContainer(['いつ遊ぶ？', 'どのくらい遊ぼうか？']),
          _smallFormContainer(['何人で遊びたい？', '予算はどのくらい？']),
          _bigForm('どこで遊ぶ？'),
          _button()
        ],
      );

  /// SmallForm

  Widget _smallFormContainer(List<String> titles) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[_smallForm(titles[0]), _smallForm(titles[1])],
      );

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

  // BigForm

  Widget _bigForm(String title) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'font-family: Hiragino Kaku Gothic ProN',
                      letterSpacing: 0.25))),
          _bigLabel()
        ],
      );

  Widget _bigLabel() => Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Color.fromRGBO(230, 234, 234, 1),
                width: 2,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(6.0)),
        width: 280,
        height: 50,
      );

  Widget _button() => RaisedButton(
        onPressed: () {},
        padding: EdgeInsets.symmetric(vertical: 17, horizontal: 33.0),
        color: Color.fromRGBO(157, 232, 104, 1),
        textColor: Colors.white,
        child: Center(
          child: Text(
            'Gettogether!',
            style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 15,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w700),
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
      );
}
