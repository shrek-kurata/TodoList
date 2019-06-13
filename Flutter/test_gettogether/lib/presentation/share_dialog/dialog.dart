import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gettogether/presentation/share_dialog/button.dart';
import 'package:gettogether/presentation/share_dialog/provider_service.dart'
    as ShareProvider;

class ShareDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SimpleDialog(
        title: _title,
        children: <Widget>[
          _optionButton(ShareProvider.Type.line),
          _optionButton(ShareProvider.Type.twitter),
          _optionButton(ShareProvider.Type.facebook)
        ],
      );

  static var _title = Text(
    '次は仲間を集めよう！',
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
        child: Button(providerType: type),
      );
}
