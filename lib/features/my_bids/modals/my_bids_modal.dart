// To parse this JSON data, do
//
//     final myBidsModal = myBidsModalFromJson(jsonString);

import 'dart:convert';

MyBidsModal myBidsModalFromJson(String str) =>
    MyBidsModal.fromJson(json.decode(str));

class MyBidsModal {
  String? message;
  List<Datum>? data;
  String? name;
  String? status;
  int? code;
  Error? error;
  Error? query;
  double? time;

  MyBidsModal({
    this.message,
    this.data,
    this.name,
    this.status,
    this.code,
    this.error,
    this.query,
    this.time,
  });

  factory MyBidsModal.fromJson(Map<String, dynamic> json) => MyBidsModal(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        name: json["name"],
        status: json["status"],
        code: json["code"],
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
        query: json["query"] == null ? null : Error.fromJson(json["query"]),
        time: json["time"]?.toDouble(),
      );
}

class Datum {
  String? id;
  String? auctioneer;
  ItemDescription? itemDescription;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? endTime;
  int? v;
  bool? won;
  WinningBid? winningBid;

  Datum({
    this.id,
    this.auctioneer,
    this.itemDescription,
    this.createdAt,
    this.updatedAt,
    this.endTime,
    this.v,
    this.won,
    this.winningBid,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        auctioneer: json["auctioneer"],
        itemDescription: json["itemDescription"] == null
            ? null
            : ItemDescription.fromJson(json["itemDescription"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        endTime: json['endTime'],
        v: json["__v"],
        won: json["won"],
        winningBid: json["winningBid"] == null
            ? null
            : WinningBid.fromJson(json["winningBid"]),
      );
}

class ItemDescription {
  String? itemName;
  String? initialPrice;
  String? itemInfo;

  ItemDescription({
    this.itemName,
    this.initialPrice,
    this.itemInfo,
  });

  factory ItemDescription.fromJson(Map<String, dynamic> json) =>
      ItemDescription(
        itemName: json["itemName"],
        initialPrice: json["initialPrice"],
        itemInfo: json["itemInfo"],
      );

  Map<String, dynamic> toJson() => {
        "itemName": itemName,
        "initialPrice": initialPrice,
        "itemInfo": itemInfo,
      };
}

class WinningBid {
  String? user;
  int? amount;

  WinningBid({
    this.user,
    this.amount,
  });

  factory WinningBid.fromJson(Map<String, dynamic> json) => WinningBid(
        user: json["user"],
        amount: json["amount"],
      );
}

class Error {
  Error();

  factory Error.fromJson(Map<String, dynamic> json) => Error();
}
