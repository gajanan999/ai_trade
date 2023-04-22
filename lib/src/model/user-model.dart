import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserModel with ChangeNotifier, DiagnosticableTreeMixin {
  String _username = '';
  String _password = '';

  String get username => _username;
  String get password => _password;

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('username', _username));
    properties.add(StringProperty('password', _password));
  }

  setUser(String username, String password) {
    _username = username;
    _password = password;
    notifyListeners();
  }
}