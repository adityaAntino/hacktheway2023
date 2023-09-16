// To parse this JSON data, do
//
//     final auctionStartResponseModal = auctionStartResponseModalFromJson(jsonString);

import 'dart:convert';

AuctionStartResponseModal auctionStartResponseModalFromJson(String str) => AuctionStartResponseModal.fromJson(json.decode(str));

String auctionStartResponseModalToJson(AuctionStartResponseModal data) => json.encode(data.toJson());

class AuctionStartResponseModal {
  String? message;
  Data? data;
  String? name;
  String? status;
  int? code;
  Data? error;
  Data? query;
  double? time;

  AuctionStartResponseModal({
    this.message,
    this.data,
    this.name,
    this.status,
    this.code,
    this.error,
    this.query,
    this.time,
  });

  factory AuctionStartResponseModal.fromJson(Map<String, dynamic> json) => AuctionStartResponseModal(
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    name: json["name"],
    status: json["status"],
    code: json["code"],
    error: json["error"] == null ? null : Data.fromJson(json["error"]),
    query: json["query"] == null ? null : Data.fromJson(json["query"]),
    time: json["time"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
    "name": name,
    "status": status,
    "code": code,
    "error": error?.toJson(),
    "query": query?.toJson(),
    "time": time,
  };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data(
  );

  Map<String, dynamic> toJson() => {
  };
}
