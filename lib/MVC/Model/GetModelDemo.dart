import 'dart:convert';

GetModelDemo getModelDemoFromJson(String str) =>
    GetModelDemo.fromJson(json.decode(str));

String getModelDemoToJson(GetModelDemo data) => json.encode(data.toJson());

class GetModelDemo {
  GetModelDemo({
    this.category,
    this.data,
  });

  String? category;
  List<Datum>? data;

  factory GetModelDemo.fromJson(Map<String, dynamic> json) => GetModelDemo(
        category: json["category"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.categoryName,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? categoryName;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        categoryName: json["category_name"],
        name: json["name"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "name": name,
        "image": image,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
