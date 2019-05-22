import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gettogether/main.dart';
import 'package:gettogether/presentation/share_dialog/provider_service.dart'
    as ShareProvider;

class Share {
  void loadDialog(BuildContext context) {
    showDialog(context: context, builder: (BuildContext context) => Dialog())
        .then((type) => ShareProvider.execute(type))
        .whenComplete(() {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => MyApp()), (_) => false);
    });
  }
}
