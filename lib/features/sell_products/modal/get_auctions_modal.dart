
import 'dart:convert';



class GetAuctionsModal {
  String? message;
  List<Datum>? data;
  String? name;
  String? status;
  int? code;
  Error? error;
  Error? query;
  double? time;

  GetAuctionsModal({
    this.message,
    this.data,
    this.name,
    this.status,
    this.code,
    this.error,
    this.query,
    this.time,
  });

  factory GetAuctionsModal.fromJson(Map<String, dynamic> json) => GetAuctionsModal(
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
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
  String? endTime;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  WinningBid? winningBid;

  Datum({
    this.id,
    this.auctioneer,
    this.itemDescription,
    this.endTime,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.winningBid,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    auctioneer: json["auctioneer"],
    itemDescription: json["itemDescription"] == null ? null : ItemDescription.fromJson(json["itemDescription"]),
    endTime: json["endTime"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    winningBid: json["winningBid"] == null ? null : WinningBid.fromJson(json["winningBid"]),
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

  factory ItemDescription.fromJson(Map<String, dynamic> json) => ItemDescription(
    itemName: json["itemName"],
    initialPrice: json["initialPrice"],
    itemInfo: json["itemInfo"],
  );


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

  factory Error.fromJson(Map<String, dynamic> json) => Error(
  );


}
