import 'package:ai_trade/src/imports.dart';
import 'package:ai_trade/src/model/gold_summary_model.dart';
import 'package:ai_trade/src/model/gold_summary_response_model.dart' as GoldSummaryResponse;
import 'package:http/http.dart' as http;

class SummaryService {
  static Future<bool> fetchGoldSummary(UserModel user, SettingsModel settings, GoldSummaryModel goldSummaryModel) async {
    try {
      final url = Uri.parse('http://${settings.hostname}${ApiConstants.summaryGoldEndpoint}');

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${user.accessToken}'
      };
      final response = await http.get(
          url,
          headers: headers,
      );
      if (response.statusCode == 200) {
        print(response.toString());
        final restResponse = GoldSummaryResponse.goldSummaryFromJson(response.body);
        if(restResponse.status != 'OK' && restResponse.errorCode == ErrorCode.SUBSCRIPTION_EXPIRED){

          goldSummaryModel.updateGoldSummary(UserMessages.SUBSCRIPTION_EXPIRED, '', '');
        }else if(restResponse.status != 'OK' && restResponse.errorCode != ErrorCode.SUBSCRIPTION_EXPIRED){

          StringBuffer stringBuffer = StringBuffer();
          stringBuffer.write('errorCode:');
          stringBuffer.write(restResponse.errorCode);
          stringBuffer.write(' errorMessage: ');
          stringBuffer.write(restResponse.errorMessage);
          goldSummaryModel.updateGoldSummary(stringBuffer.toString(), '', '');
        }else{
          print(restResponse.data!.summary);
          goldSummaryModel.updateGoldSummary(restResponse.data!.summary!, restResponse.data!.signal!,  restResponse.data!.time!);
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

  static Future<bool> fetchEuroSummary(UserModel user, SettingsModel settings, GoldSummaryModel goldSummaryModel) async {
    try {
      final url = Uri.parse('http://${settings.hostname}${ApiConstants.summaryEuroEndpoint}');

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${user.accessToken}'
      };
      final response = await http.get(
        url,
        headers: headers,
      );
      if (response.statusCode == 200) {
        print(response.toString());
        final restResponse = GoldSummaryResponse.goldSummaryFromJson(response.body);
        print(restResponse.data!.summary);
        goldSummaryModel.updateGoldSummary(restResponse.data!.summary!, restResponse.data!.signal!, restResponse.data!.time!);
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

}
