


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
  UserData? user;

  Data({
    this.token,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    user: json["user"] == null ? null : UserData.fromJson(json["user"]),
  );


}

class UserData {
  String? userType;
  String? id;
  String? mobileNo;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? email;
  String? gender;
  String? name;

  UserData({
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

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
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

  void fromModel(UserData userData){
    userType = userData.userType;
    id = userData.id;
    mobileNo = userData.mobileNo;
    email = userData.email;
    gender = userData.gender;
    name = userData.name;
    createdAt = userData.createdAt;
  }

}

class Error {
  Error();

  factory Error.fromJson(Map<String, dynamic> json) => Error(
  );


}
