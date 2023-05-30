import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  List<Datum> data;
  String errorCode;
  String errorMessage;
  String status;

  LoginResponse({
    required this.data,
    required this.errorCode,
    required this.errorMessage,
    required this.status,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    errorCode: json["errorCode"],
    errorMessage: json["errorMessage"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "errorCode": errorCode,
    "errorMessage": errorMessage,
    "status": status,
  };
}

class Datum {
  String token;

  String getToken() => this.token;

  Datum({
    required this.token,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    token: json["token"] != null && json['token'] != '' ?json['token'] : '',
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };

}
