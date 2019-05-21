import 'package:flutter/material.dart';
import 'package:gettogether/presentation/share_dialog/provider_service.dart' as ShareProvider;

class Share {
  void loadDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
              title: Text('選択してください'),
              children: <Widget>[
                _optionButton(context, ShareProvider.Type.line),
                _optionButton(context, ShareProvider.Type.twitter),
                _optionButton(context, ShareProvider.Type.facebook),
              ],
            ));
  }

  Widget _optionButton(BuildContext context, ShareProvider.Type type) =>
      SimpleDialogOption(
        child: RaisedButton(
          onPressed: () {},
          child: Container(
            child: Row(
              children: <Widget>[
                Text(ShareProvider.convertToString(type)),
                ShareProvider.convertToImage(type)
              ],
            ),
          ),
        ),
      );
}
