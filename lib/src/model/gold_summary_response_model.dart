import 'dart:convert';

GoldSummaryResponse goldSummaryFromJson(String str) => GoldSummaryResponse.fromJson(json.decode(str));

// String goldSummaryResponseToJson(GoldSummaryResponse data) => json.encode(data.toJson());

class GoldSummaryResponse {
  final SummaryData? data;
  final String? errorMessage;
  final String? errorCode;
  final String? status;

  GoldSummaryResponse({
    this.data,
    this.errorMessage,
    this.errorCode,
    this.status,
  });

  factory GoldSummaryResponse.fromJson(Map<String, dynamic> json) {
    return GoldSummaryResponse(
      data: json['data'] != null && json['data'] != '' ? SummaryData.fromJson(json['data'][0]) : null,
      errorMessage: json['errorMessage'],
      errorCode: json['errorCode'],
      status: json['status'],
    );
  }
}

class SummaryData {
  final String? summary;
  final String? signal;
  final String? time;

  SummaryData({this.summary, this.signal, this.time});

  factory SummaryData.fromJson(Map<String, dynamic> json) {
    return SummaryData(
      summary: json['summary'] ?? '',
      signal: json['signal'] ?? '',
      time: json['time'] ?? ''
    );
  }
}
