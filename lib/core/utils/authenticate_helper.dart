class AuthenticateHelper {
  bool _isLoggedIn;

  AuthenticateHelper() : _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  bool login() {
    _isLoggedIn = true;
    return _isLoggedIn;
  }

  void logout() {
    _isLoggedIn = false;
  }
}
