import 'package:flutter/material.dart';
import 'package:gettogether/presentation/share_dialog/provider_service.dart';
import 'package:gettogether/presentation/shared/icons.dart' as Icon;


class Share {
  void loadDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
              title: Text('選択してください'),
              children: <Widget>[SimpleDialogOption(), SimpleDialogOption()],
            ));
  }

  Widget _optionButton(BuildContext context, ShareProviderType type) => SimpleDialogOption(
        onPressed: () {},
        child: RaisedButton(
          child: Container(
            child: Row(children: <Widget>[
              
            ],),
          ),),
      );

}
