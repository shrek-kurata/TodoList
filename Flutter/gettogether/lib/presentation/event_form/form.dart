import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gettogether/presentation/event_form/big_form.dart';
import 'package:gettogether/presentation/event_form/button.dart';
import 'package:gettogether/presentation/event_form/small_form.dart';

class EventForm {
  Widget view() => Container(
      width: 330,
      height: 430,
      padding: _edgeInsets,
      decoration: _circleRadius,
      child: _itemContainer());

  Widget _itemContainer() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          BigForm('どのスポーツをしたい？').show(),
          SmallForm(['いつ遊ぶ？', 'どのくらい遊ぼうか？']).show(),
          SmallForm(['何人で遊びたい？', '予算はどのくらい？']).show(),
          BigForm('どこで遊ぶ？').show(),
          Button().show()
        ],
      );

  static var _edgeInsets = EdgeInsets.symmetric(vertical: 20, horizontal: 24);
  static var _circleRadius = BoxDecoration(
      borderRadius: BorderRadius.circular(8.0), color: Colors.white);
}
