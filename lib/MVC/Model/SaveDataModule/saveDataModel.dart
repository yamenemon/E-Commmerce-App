// To parse this JSON data, do
//
//     final saveDataModel = saveDataModelFromJson(jsonString);

import 'dart:convert';

SaveDataModel saveDataModelFromJson(String str) => SaveDataModel.fromJson(json.decode(str));

String saveDataModelToJson(SaveDataModel data) => json.encode(data.toJson());

class SaveDataModel {
    SaveDataModel({
        this.status,
        this.userid,
        this.msg,
    });

    int? status;
    int? userid;
    String? msg;

    factory SaveDataModel.fromJson(Map<String, dynamic> json) => SaveDataModel(
        status: json["status"],
        userid: json["userid"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "userid": userid,
        "msg": msg,
    };
}
