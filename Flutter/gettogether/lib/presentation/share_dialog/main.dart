import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gettogether/main.dart';
import 'package:gettogether/presentation/share_dialog/button.dart';
import 'package:gettogether/presentation/share_dialog/provider_service.dart'
    as ShareProvider;

class Share {
  void loadDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
              title: _text,
              children: <Widget>[
                _optionButton(ShareProvider.Type.line),
                _optionButton(ShareProvider.Type.twitter),
                _optionButton(ShareProvider.Type.facebook),
              ],
            )).then((type) => {ShareProvider.execute(type)}).whenComplete(() {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => MyApp()), (_) => false);
    });
  }

  Text _text = Text(
    ' 次は仲間を集めよう！',
    style: _titleTextStyle,
    textAlign: TextAlign.center,
  );

  static var _titleTextStyle = TextStyle(
      fontFamily: 'Hiragino Kaku Gothic ProN',
      fontSize: 17,
      color: _titleTextColor);

  static var _titleTextColor = Color.fromRGBO(30, 30, 36, 1);

  SimpleDialogOption _optionButton(ShareProvider.Type type) =>
      SimpleDialogOption(
        onPressed: () {},
        child: Button(),
      );
}
