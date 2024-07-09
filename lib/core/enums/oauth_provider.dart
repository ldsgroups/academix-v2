enum CsOAuthProvider {
  google,
  facebook,
}

String csOAuthProviderToString(CsOAuthProvider value) {
  switch (value) {
    case CsOAuthProvider.google:
      return 'google';
    case CsOAuthProvider.facebook:
      return 'facebook';
  }
}
