

class CloseAuctionModal {
  String? message;
  Data? data;
  String? name;
  String? status;
  int? code;
  Error? error;
  Error? query;
  double? time;

  CloseAuctionModal({
    this.message,
    this.data,
    this.name,
    this.status,
    this.code,
    this.error,
    this.query,
    this.time,
  });

  factory CloseAuctionModal.fromJson(Map<String, dynamic> json) => CloseAuctionModal(
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    name: json["name"],
    status: json["status"],
    code: json["code"],
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
    query: json["query"] == null ? null : Error.fromJson(json["query"]),
    time: json["time"]?.toDouble(),
  );


}

class Data {
  String? userName;
  int? highestBidPlaced;

  Data({
    this.userName,
    this.highestBidPlaced,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userName: json["userName"],
    highestBidPlaced: json["highestBidPlaced"],
  );

}

class Error {
  Error();

  factory Error.fromJson(Map<String, dynamic> json) => Error(
  );


}
