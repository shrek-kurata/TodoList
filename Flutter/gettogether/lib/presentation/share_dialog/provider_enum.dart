enum ShareProviderType { line, twitter, facebook }

class Provider {
  String providerToIconUrl(ShareProviderType type) {
    switch (type) {
      case ShareProviderType.line:
        return 'assets/images';
      case ShareProviderType.facebook:
        return 'assets/images';
      case ShareProviderType.twitter:
        return 'assets/images';
      default:
        return 'assets/images';
    }
  }
}
