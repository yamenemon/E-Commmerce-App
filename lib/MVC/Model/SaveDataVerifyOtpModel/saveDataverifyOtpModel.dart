// To parse this JSON data, do
//
//     final saveDataVerifyOtpModel = saveDataVerifyOtpModelFromJson(jsonString);

import 'dart:convert';

SaveDataVerifyOtpModel saveDataVerifyOtpModelFromJson(String str) =>
    SaveDataVerifyOtpModel.fromJson(json.decode(str));

String saveDataVerifyOtpModelToJson(SaveDataVerifyOtpModel data) =>
    json.encode(data.toJson());

class SaveDataVerifyOtpModel {
  SaveDataVerifyOtpModel({
    this.status,
    this.userid,
    this.msg,
    this.profile,
  });

  int? status;
  int? userid;
  String? msg;
  dynamic profile;

  factory SaveDataVerifyOtpModel.fromJson(Map<String, dynamic> json) =>
      SaveDataVerifyOtpModel(
        status: json["status"],
        userid: json["userid"],
        msg: json["msg"],
        profile: json["profile"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "userid": userid,
        "msg": msg,
        "profile": profile,
      };
}
