import 'package:ai_trade/src/imports.dart';
import 'package:ai_trade/src/model/gold_summary_model.dart';
import 'package:ai_trade/src/model/gold_summary_response_model.dart' as GoldSummaryResponse;
import 'package:ai_trade/src/model/user-profile-model.dart';
import 'package:http/http.dart' as http;

class UserProfileService {

  static Future<bool> fetchUserProfile(UserModel user, SettingsModel settings, UserProfileModel userProfileModel) async {
    try{

      final url = Uri.parse('http://${settings.hostname}${ApiConstants.profileEndpoint}');

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${user.accessToken}'
      };
      final response = await http.get(
        url,
        headers: headers,
      );
      if (response.statusCode == 200) {
          final restResponse = jsonDecode(response.body);
          if(restResponse['status'] != 'OK' && restResponse['errorCode'] == ErrorCode.SUBSCRIPTION_EXPIRED){
            print(restResponse.toString());


          }else if(restResponse['status'] != 'OK' && restResponse['errorCode'] != ErrorCode.SUBSCRIPTION_EXPIRED){
            StringBuffer stringBuffer = StringBuffer();
            stringBuffer.write('errorCode:');
            stringBuffer.write(restResponse['errorCode']);
            stringBuffer.write(' errorMessage: ');
            stringBuffer.write(restResponse['errorMessage']);
          }else{
            print(restResponse.toString());
            final data = restResponse['data'];
            print('data: '+ data.toString());
            for(final account in data){
              print('account '+ account.toString());
              final acc = account['account'];
              userProfileModel.setEmail(acc['email']);
              userProfileModel.setName(acc['name']);
              userProfileModel.setMobileNr(acc['mobile_no']);
              userProfileModel.setStartDate(acc['start_date']);
              userProfileModel.setEndDate(acc['end_date']);
              print('UserProfileModel '+ userProfileModel.toString());
            }
          }
          return true;
      } else {
          return false;
      }
    } catch (error, stackTrace) {
      print('Error: $error');
      print('Stack trace: $stackTrace');
      return false;
    }
  }

  static Future<String> updateUserProfile(UserModel user, SettingsModel settings, UserProfileModel userProfileModel) async {
    try{

      final url = Uri.parse('http://${settings.hostname}${ApiConstants.userProfileUpdateEndpoint}');

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${user.accessToken}'
      };

      final body = {
        'name': userProfileModel.name,
        'old_pass': userProfileModel.oldPassword,
        'new_pass': userProfileModel.newPassword,
        'email': userProfileModel.email
      };
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body)
      );
      if (response.statusCode == 200) {
        final restResponse = jsonDecode(response.body);
        if(restResponse['status'] != 'OK' && restResponse['errorCode'] == ErrorCode.SUBSCRIPTION_EXPIRED){

          print(restResponse.toString());
          return restResponse['errorMessage'];
        }else if(restResponse['status'] != 'OK' && restResponse['errorCode'] != ErrorCode.SUBSCRIPTION_EXPIRED){

          StringBuffer stringBuffer = StringBuffer();
          stringBuffer.write('errorCode:');
          stringBuffer.write(restResponse['errorCode']);
          stringBuffer.write(' errorMessage: ');
          stringBuffer.write(restResponse['errorMessage']);
          print(restResponse.toString());
          return restResponse['errorMessage'];
        }else{
          print(restResponse.toString());
          return "SUCCESS";
        }
      } else {
        return "Failed! Something went Wrong";
      }
    } catch (error, stackTrace) {
      print('Error: $error');
      print('Stack trace: $stackTrace');
      return "Failed! Something went Wrong";
    }
  }


}

