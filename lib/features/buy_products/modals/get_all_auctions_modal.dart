// To parse this JSON data, do
//
//     final getAllAuctionsModal = getAllAuctionsModalFromJson(jsonString);

import 'dart:convert';

GetAllAuctionsModal getAllAuctionsModalFromJson(String str) =>
    GetAllAuctionsModal.fromJson(json.decode(str));

class GetAllAuctionsModal {
  String? message;
  List<Datum>? data;
  String? name;
  String? status;
  int? code;
  Error? error;
  Error? query;
  double? time;

  GetAllAuctionsModal({
    this.message,
    this.data,
    this.name,
    this.status,
    this.code,
    this.error,
    this.query,
    this.time,
  });

  factory GetAllAuctionsModal.fromJson(Map<String, dynamic> json) =>
      GetAllAuctionsModal(
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
  Auctioneer? auctioneer;
  ItemDescription? itemDescription;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  WinningBid? winningBid;
  String? endTime;

  Datum({
    this.id,
    this.auctioneer,
    this.itemDescription,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.winningBid,
    this.endTime,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        auctioneer: auctioneerValues.map[json["auctioneer"]]!,
        itemDescription: json["itemDescription"] == null
            ? null
            : ItemDescription.fromJson(json["itemDescription"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        winningBid: json["winningBid"] == null
            ? null
            : WinningBid.fromJson(json["winningBid"]),
        endTime: json["endTime"],
      );
}

enum Auctioneer { THE_65058506_D77_FF5623_B1_DEC7_E }

final auctioneerValues = EnumValues(
    {"65058506d77ff5623b1dec7e": Auctioneer.THE_65058506_D77_FF5623_B1_DEC7_E});

class ItemDescription {
  ItemName? itemName;
  String? initialPrice;
  ItemInfo? itemInfo;

  ItemDescription({
    this.itemName,
    this.initialPrice,
    this.itemInfo,
  });

  factory ItemDescription.fromJson(Map<String, dynamic> json) =>
      ItemDescription(
        itemName: itemNameValues.map[json["itemName"]]!,
        initialPrice: json["initialPrice"],
        itemInfo: itemInfoValues.map[json["itemInfo"]]!,
      );
}

enum ItemInfo { THE_22_MALE }

final itemInfoValues = EnumValues({"22 Male": ItemInfo.THE_22_MALE});

enum ItemName { MANAS }

final itemNameValues = EnumValues({"Manas": ItemName.MANAS});

class WinningBid {
  String? user;
  dynamic amount;

  WinningBid({
    this.user,
    this.amount,
  });

  factory WinningBid.fromJson(Map<String, dynamic> json) => WinningBid(
        user: json["user"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "amount": amount,
      };
}

class Error {
  Error();

  factory Error.fromJson(Map<String, dynamic> json) => Error();
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
