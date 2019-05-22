import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gettogether/presentation/event_form/big_form.dart';
import 'package:gettogether/presentation/event_form/button.dart';
import 'package:gettogether/presentation/event_form/small_form.dart';

class EventForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 330,
        height: 430,
        padding: _edgeInsets,
        decoration: _circleRadius,
        child: _itemContainer());
  }

  Widget _itemContainer() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          BigForm(title: 'どのスポーツをしたい？'),
          SmallForm(titles: ['いつ遊ぶ？', 'どのくらい遊ぼうか？']),
          SmallForm(titles: ['何人で遊びたい？', '予算はどのくらい？']),
          BigForm(title: 'どこで遊ぶ？'),
          FormButton()
        ],
      );

  static var _edgeInsets = EdgeInsets.symmetric(vertical: 20, horizontal: 24);
  static var _circleRadius = BoxDecoration(
      borderRadius: BorderRadius.circular(8.0), color: Colors.white);
}
