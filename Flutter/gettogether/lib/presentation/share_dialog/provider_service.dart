import 'package:flutter/material.dart';

enum Type { line, twitter, facebook }

String convertToString(Type type) {
  switch (type) {
    case Type.line:
      return 'Line';
    case Type.facebook:
      return 'Facebook';
    case Type.twitter:
      return 'Twitter';
    default:
      return '倉田';
  }
}

Widget convertToImage(Type type) {
  switch (type) {
    case Type.line:
      return Image.asset('images/logo/twitter.jpg');
    case Type.facebook:
      return Image.asset('images/logo/twitter.jpg');
    case Type.twitter:
      return Image.asset('images/logo/twitter.jpg');
    default:
      return Image.asset('images/logo/kurata.jpg');
  }
}
