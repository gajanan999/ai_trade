import 'package:ai_trade/src/imports.dart';
import 'package:ai_trade/src/model/login_response_model.dart' as LoginResponse;
import 'package:http/http.dart' as http;

class AuthService {
  static Future<bool> loginUser(UserModel user, SettingsModel settings) async {
    try {
      final url = Uri.parse('http://${settings.hostname}${ApiConstants.loginEndpoint}');

      final headers = {'Content-Type': 'application/json'};
      final body = {'mobile_no': user.mobileNumber, 'password': user.password};
      print(url);
      print(body);
      final response = await http.post(
          url,
          headers: headers,
          body: jsonEncode(body)
      );


      if (response.statusCode == 200) {
        // Successful API call
        //print(response.body);
        final restResponse = LoginResponse.loginResponseFromJson(response.body);

        print(restResponse.data[0].getToken());
        if(restResponse.data.isNotEmpty && restResponse.data[0].getToken() != ''){
          user.setToken(restResponse.data[0].getToken());
          print(user);
        }
        return true;
      } else {
        // Unsuccessful API call
        user.setToken('');
        return false;
      }
    } catch (error, stackTrace) {
      print('Error: $error');
      print('Stack trace: $stackTrace');
      return false;
    }
  }

  static Future<String> registerUser(UserModel user, SettingsModel settings) async {
    try {
      final url = Uri.parse('http://${settings.hostname}${ApiConstants.signupEndpoint}');
      final headers = {'Content-Type': 'application/json'};
      final body = {
        'name': user.username,
        'password': user.password,
        'mobile': user.mobileNumber,
        'email': user.email
      };
      final response = await http.post(
          url,
          headers: headers,
          body: jsonEncode(body)
      );

      if (response.statusCode == 200) {

        final restResponse = jsonDecode(response.body);

        if(restResponse['status'] == 'OK' && restResponse['errorCode'] == ''){
          print(restResponse);
          return 'SUCCESS';
        }else {
          print(restResponse);
          return restResponse['errorMessage'];
        }
      } else {
        // Unsuccessful API call
        print(response.toString());
        return 'Something Went Wrong! Please contact Administrator';
      }
    } catch (error, stackTrace) {
      print('Error: $error');
      print('Stack trace: $stackTrace');
      return 'Something Went Wrong! Please contact Administrator';
    }
  }
  static Future<bool> logoutUser(UserModel user,SettingsModel settings) async {
    try {
      final url = Uri.parse('http://${settings.hostname}${ApiConstants.logoutEndpoint}');
      final headers = {'Content-Type': 'application/json'};
      final body = {
        'token': user.accessToken
      };
      final response = await http.post(
          url,
          headers: headers,
          body: jsonEncode(body)
      );

      if (response.statusCode == 200) {
        // Successful API call
        return true;
      } else {
        // Unsuccessful API call
        return false;
      }
    } catch (error, stackTrace) {
      print('Error: $error');
      print('Stack trace: $stackTrace');
      return false;
    }
  }
}
