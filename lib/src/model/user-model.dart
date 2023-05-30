import 'package:ai_trade/src/imports.dart';
import 'package:http/http.dart' as http;

class UserModel with ChangeNotifier, DiagnosticableTreeMixin {
  String _username = '';
  String _password = '';
  String _confirmPassword = '';
  String _mobileNumber= '';
  String _accessToken= '';
  String _email = '';

  String get username => _username;
  String get password => _password;
  String get mobileNumber => _mobileNumber;
  String get confirmPassword => _confirmPassword;
  String get accessToken => _accessToken;
  String get email => _email;

  set username(username){
    _username = username;
  }
  set password(password){
    _password = password;
  }
  set mobileNumber(mobileNumber){
    _mobileNumber = mobileNumber;
  }

  set confirmPassword(confirmPassword){
    _confirmPassword = confirmPassword;
  }

  set accessToken(accessToken){
    _accessToken = accessToken;
  }

  set email(email){
    _email = email;
  }
  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('username', _username));
    properties.add(StringProperty('password', _password));
    properties.add(StringProperty('confirmPassword', _confirmPassword));
    properties.add(StringProperty('mobileNumber', _mobileNumber));
    properties.add(StringProperty('accessToken', _accessToken));
  }

  setUser(String username, String password) {
    _username = username;
    _password = password;
    notifyListeners();
  }

  setToken(String token){
    _accessToken = token;
    notifyListeners();
  }

}