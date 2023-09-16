


class VerifyOtpResponse {
  String? message;
  Data? data;
  String? name;
  String? status;
  int? code;
  Error? error;
  Error? query;
  double? time;

  VerifyOtpResponse({
    this.message,
    this.data,
    this.name,
    this.status,
    this.code,
    this.error,
    this.query,
    this.time,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) => VerifyOtpResponse(
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
  String? token;
  User? user;

  Data({
    this.token,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );


}

class User {
  String? userType;
  String? id;
  String? mobileNo;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? email;
  String? gender;
  String? name;

  User({
    this.userType,
    this.id,
    this.mobileNo,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.email,
    this.gender,
    this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userType: json["userType"],
    id: json["_id"],
    mobileNo: json["mobileNo"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    email: json["email"],
    gender: json["gender"],
    name: json["name"],
  );


}

class Error {
  Error();

  factory Error.fromJson(Map<String, dynamic> json) => Error(
  );


}
