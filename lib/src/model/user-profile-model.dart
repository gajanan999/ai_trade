import 'package:ai_trade/src/imports.dart';
import 'package:http/http.dart' as http;

class UserProfileModel with ChangeNotifier, DiagnosticableTreeMixin {
  String _name = '';
  String _email = '';
  String _startDate = '';
  String _endDate = '';
  String _mobileNr = '';
  String _oldPassword = '';
  String _newPassword = '';

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('name', name));
    properties.add(StringProperty('email', email));
    properties.add(StringProperty('start Date', startDate));
    properties.add(StringProperty('end Date', endDate));
    properties.add(StringProperty('mobile no', mobileNr));
    properties.add(StringProperty('old password', oldPassword));
    properties.add(StringProperty('new password', newPassword));
  }

  String get mobileNr => _mobileNr;

  String get endDate => _endDate;

  String get startDate => _startDate;

  String get email => _email;

  String get name => _name;

  String get oldPassword => _oldPassword;

  String get newPassword => _newPassword;

  setName(name){
    _name = name;
    notifyListeners();
  }

  setEmail(email){
    _email = email;
    notifyListeners();
  }

  setMobileNr(mobileNr){
    _mobileNr = mobileNr;
    notifyListeners();
  }

  setStartDate(startDate){
    _startDate = startDate ?? '';
    notifyListeners();
  }

  setEndDate(endDate){
    _endDate = endDate ?? '';
    notifyListeners();
  }

  setOldPassword(oldPassword){
    _oldPassword = oldPassword;
    notifyListeners();
  }
  setNewPassword(newPassword){
    _newPassword = newPassword;
    notifyListeners();
  }


}