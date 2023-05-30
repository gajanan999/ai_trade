import 'package:ai_trade/src/imports.dart';

SettingsModel settingsModelFromJson(String str) => SettingsModel.fromJson(json.decode(str));

String settingsModelToJson(SettingsModel data) => json.encode(data.toJson());

class SettingsModel with ChangeNotifier, DiagnosticableTreeMixin {
  String hostname = '127.0.0.1:5000';

  SettingsModel({
    required this.hostname,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
    hostname: json["hostname"],
  );

  Map<String, dynamic> toJson() => {
    "hostname": hostname,
  };

  void updateHostname(String newHostname) {
    hostname = newHostname;
    notifyListeners();
  }
}
