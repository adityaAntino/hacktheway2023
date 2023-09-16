// To parse this JSON data, do
//
//     final sendOtpResponse = sendOtpResponseFromJson(jsonString);

import 'dart:convert';


class SendOtpResponse {
  String? message;
  Data? data;
  String? name;
  String? status;
  int? code;
  Data? error;
  Data? query;
  double? time;

  SendOtpResponse({
    this.message,
    this.data,
    this.name,
    this.status,
    this.code,
    this.error,
    this.query,
    this.time,
  });

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) => SendOtpResponse(
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    name: json["name"],
    status: json["status"],
    code: json["code"],
    error: json["error"] == null ? null : Data.fromJson(json["error"]),
    query: json["query"] == null ? null : Data.fromJson(json["query"]),
    time: json["time"]?.toDouble(),
  );

}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data(
  );

}
