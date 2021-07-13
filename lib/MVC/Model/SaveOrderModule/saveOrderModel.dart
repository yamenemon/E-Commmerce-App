import 'dart:convert';

SaveOrderModel saveOrderModelFromJson(String str) =>
    SaveOrderModel.fromJson(json.decode(str));

String saveOrderModelToJson(SaveOrderModel data) => json.encode(data.toJson());

class SaveOrderModel {
  SaveOrderModel({
    this.userId,
    this.productPrice,
    this.deliveryCharge,
    this.subTotal,
    this.discount,
    this.totalPrice,
    this.name,
    this.mobile,
    this.house,
    this.flat,
    this.road,
    this.block,
    this.area,
    this.deliveryNote,
    this.instruction,
    this.os,
    this.pushToken,
    this.orderDetails,
  });

  int? userId;
  double? productPrice;
  int? deliveryCharge;
  double? subTotal;
  int? discount;
  double? totalPrice;
  String? name;
  String? mobile;
  String? house;
  String? flat;
  String? road;
  String? block;
  String? area;
  String? deliveryNote;
  String? instruction;
  String? os;
  String? pushToken;
  List<OrderDetail>? orderDetails;

  factory SaveOrderModel.fromJson(Map<String, dynamic> json) => SaveOrderModel(
        userId: json["userId"],
        productPrice: json["productPrice"].toDouble(),
        deliveryCharge: json["deliveryCharge"],
        subTotal: json["subTotal"].toDouble(),
        discount: json["discount"],
        totalPrice: json["totalPrice"].toDouble(),
        name: json["name"],
        mobile: json["mobile"],
        house: json["house"],
        flat: json["flat"],
        road: json["road"],
        block: json["block"],
        area: json["area"],
        deliveryNote: json["deliveryNote"],
        instruction: json["instruction"],
        os: json["os"],
        pushToken: json["pushToken"],
        orderDetails: List<OrderDetail>.from(
            json["order_details"].map((x) => OrderDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "productPrice": productPrice,
        "deliveryCharge": deliveryCharge,
        "subTotal": subTotal,
        "discount": discount,
        "totalPrice": totalPrice,
        "name": name,
        "mobile": mobile,
        "house": house,
        "flat": flat,
        "road": road,
        "block": block,
        "area": area,
        "deliveryNote": deliveryNote,
        "instruction": instruction,
        "os": os,
        "pushToken": pushToken,
        "order_details":
            List<dynamic>.from(orderDetails!.map((x) => x.toJson())),
      };
}

class OrderDetail {
  OrderDetail({
    this.productId,
    this.price,
    this.productSalePrice,
    this.productUnit,
    this.productQty,
  });

  int? productId;
  double? price;
  int? productSalePrice;
  String? productUnit;
  int? productQty;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        productId: json["productId"],
        price: json["price"].toDouble(),
        productSalePrice: json["productSalePrice"],
        productUnit: json["productUnit"],
        productQty: json["productQty"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "price": price,
        "productSalePrice": productSalePrice,
        "productUnit": productUnit,
        "productQty": productQty,
      };
}
