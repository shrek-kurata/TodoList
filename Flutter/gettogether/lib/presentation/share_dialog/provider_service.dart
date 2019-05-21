import 'package:flutter/rendering.dart';
import 'package:gettogether/presentation/shared/icons.dart' as Icon;

enum ShareProviderType { line, twitter, facebook }

class Provider {
  String convertToString(ShareProviderType type) {
    switch (type) {
      case ShareProviderType.line:
        return 'Line';
      case ShareProviderType.facebook:
        return 'Facebook';
      case ShareProviderType.twitter:
        return 'Twitter';
      default:
        return '倉田';
    }
  }

  AssetImage convertToImage(ShareProviderType type) {
    switch (type) {
      case ShareProviderType.line:
        return Icon.line();
      case ShareProviderType.facebook:
        return Icon.facebook();
      case ShareProviderType.twitter:
        return Icon.twitter();
      default:
        return Icon.kurata();
    }
  }
}
