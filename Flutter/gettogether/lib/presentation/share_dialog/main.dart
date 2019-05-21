import 'package:flutter/material.dart';


class Share {
  void loadDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
              title: Text('選択してください'),
              children: <Widget>[SimpleDialogOption(), SimpleDialogOption()],
            ));
  }

  Widget _optionButton() => SimpleDialogOption(
        onPressed: () {},
        child: Text(''),
      );

}
