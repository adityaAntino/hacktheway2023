
class GetBidCountModal {
  String? message;
  Data? data;
  String? name;
  String? status;
  int? code;
  Error? error;
  Error? query;
  double? time;

  GetBidCountModal({
    this.message,
    this.data,
    this.name,
    this.status,
    this.code,
    this.error,
    this.query,
    this.time,
  });

  factory GetBidCountModal.fromJson(Map<String, dynamic> json) => GetBidCountModal(
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
  int? count;

  Data({
    this.count,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    count: json["count"],
  );


}

class Error {
  Error();

  factory Error.fromJson(Map<String, dynamic> json) => Error(
  );


}
