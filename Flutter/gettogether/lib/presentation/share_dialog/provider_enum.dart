enum ShareProviderType { line, twitter, facebook }

class Provider {
  String providerToIconUrl(ShareProviderType type) {
    switch (type) {
      case ShareProviderType.line:
        return 'images/logo/line.jpg';
      case ShareProviderType.facebook:
        return 'images/logo/facebook.jpg';
      case ShareProviderType.twitter:
        return 'images/logo/twitter.jpg';
      default:
        return 'images/倉田.jpg';
    }
  }
}
