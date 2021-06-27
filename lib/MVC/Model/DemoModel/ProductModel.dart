// // // To parse this JSON data, do
// // //
// // //     final productModel = productModelFromJson(jsonString);

// // import 'dart:convert';

// // List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
// //     json.decode(str).map((x) => ProductModel.fromJson(x)));

// // String productModelToJson(List<ProductModel> data) =>
// //     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// // class ProductModel {
// //   ProductModel({
// //     this.id,
// //     this.title,
// //     this.price,
// //     this.description,
// //     this.category,
// //     this.image,
// //   });

// //   int? id;
// //   String? title;
// //   double? price;
// //   String? description;
// //   Category? category;
// //   String? image;

// //   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
// //         id: json["id"] == null ? null : json["id"],
// //         title: json["title"] == null ? null : json["title"],
// //         price: json["price"] == null ? null : json["price"].toDouble(),
// //         description: json["description"] == null ? null : json["description"],
// //         category: json["category"] == null
// //             ? null
// //             : categoryValues.map[json["category"]],
// //         image: json["image"] == null ? null : json["image"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "id": id == null ? null : id,
// //         "title": title == null ? null : title,
// //         "price": price == null ? null : price,
// //         "description": description == null ? null : description,
// //         "category": category == null ? null : categoryValues.reverse[category],
// //         "image": image == null ? null : image,
// //       };
// // }

// // enum Category { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

// // final categoryValues = EnumValues({
// //   "electronics": Category.ELECTRONICS,
// //   "jewelery": Category.JEWELERY,
// //   "men's clothing": Category.MEN_S_CLOTHING,
// //   "women's clothing": Category.WOMEN_S_CLOTHING
// // });

// // class EnumValues<T> {
// //   late Map<String, T> map;
// //   late Map<T, String> reverseMap;

// //   EnumValues(this.map);

// //   Map<T, String> get reverse {
// //     if (reverseMap == null) {
// //       reverseMap = map.map((k, v) => new MapEntry(v, k));
// //     }
// //     return reverseMap;
// //   }
// // }

// class ProductModel {
//   int? id;
//   String? title;
//   double? price;
//   String? description;
//   String? category;
//   String? image;

//   ProductModel(
//       {this.id,
//       this.title,
//       this.price,
//       this.description,
//       this.category,
//       this.image});

//   ProductModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     price = json['price'];
//     description = json['description'];
//     category = json['category'];
//     image = json['image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['price'] = this.price;
//     data['description'] = this.description;
//     data['category'] = this.category;
//     data['image'] = this.image;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);
// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
      };
}
