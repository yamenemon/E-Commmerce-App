// To parse this JSON data, do
//
//     final orderHistoryModel = orderHistoryModelFromJson(jsonString);

import 'dart:convert';

OrderHistoryModel orderHistoryModelFromJson(String str) =>
    OrderHistoryModel.fromJson(json.decode(str));

String orderHistoryModelToJson(OrderHistoryModel data) =>
    json.encode(data.toJson());

class OrderHistoryModel {
  OrderHistoryModel({
    this.status,
    this.msg,
    this.orders,
  });

  int? status;
  String? msg;
  List<Order>? orders;

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) =>
      OrderHistoryModel(
        status: json["status"],
        msg: json["msg"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    this.orderId,
    this.orderDate,
    this.productPrice,
    this.deliveryCharge,
    this.totalPrice,
    this.discount,
    this.payablePrice,
    this.due,
    this.orderStatus,
    this.name,
    this.house,
    this.flat,
    this.road,
    this.block,
    this.area,
    this.instruction,
    this.deliveryNote,
    this.deliveryDate,
    this.cancelNote,
    this.adminMsg,
    this.productList,
  });

  int? orderId;
  String? orderDate;
  int? productPrice;
  int? deliveryCharge;
  int? totalPrice;
  int? discount;
  int? payablePrice;
  int? due;
  int? orderStatus;
  String? name;
  String? house;
  String? flat;
  String? road;
  String? block;
  String? area;
  String? instruction;
  String? deliveryNote;
  dynamic deliveryDate;
  String? cancelNote;
  String? adminMsg;
  List<ProductList>? productList;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        orderDate: json["order_date"],
        productPrice: json["product_price"],
        deliveryCharge: json["delivery_charge"],
        totalPrice: json["total_price"],
        discount: json["discount"],
        payablePrice: json["payable_price"],
        due: json["due"],
        orderStatus: json["order_status"],
        name: json["name"],
        house: json["house"],
        flat: json["flat"],
        road: json["road"],
        block: json["block"],
        area: json["area"],
        instruction: json["instruction"],
        deliveryNote: json["delivery_note"],
        deliveryDate: json["delivery_date"],
        cancelNote: json["cancel_note"],
        adminMsg: json["admin_msg"],
        productList: List<ProductList>.from(
            json["product_list"].map((x) => ProductList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "order_date": orderDate,
        "product_price": productPrice,
        "delivery_charge": deliveryCharge,
        "total_price": totalPrice,
        "discount": discount,
        "payable_price": payablePrice,
        "due": due,
        "order_status": orderStatus,
        "name": name,
        "house": house,
        "flat": flat,
        "road": road,
        "block": block,
        "area": area,
        "instruction": instruction,
        "delivery_note": deliveryNote,
        "delivery_date": deliveryDate,
        "cancel_note": cancelNote,
        "admin_msg": adminMsg,
        "product_list": List<dynamic>.from(productList!.map((x) => x.toJson())),
      };
}

class ProductList {
  ProductList({
    this.productId,
    this.nameEn,
    this.nameBn,
    this.descriptionEn,
    this.descriptionBn,
    this.picture,
    this.price,
    this.salePrice,
    this.unit,
    this.qty,
    this.isDelivered,
  });

  int? productId;
  String? nameEn;
  String? nameBn;
  String? descriptionEn;
  String? descriptionBn;
  String? picture;
  int? price;
  int? salePrice;
  String? unit;
  int? qty;
  int? isDelivered;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        productId: json["product_id"],
        nameEn: json["name_en"],
        nameBn: json["name_bn"],
        descriptionEn: json["description_en"],
        descriptionBn: json["description_bn"],
        picture: json["picture"],
        price: json["price"],
        salePrice: json["sale_price"],
        unit: json["unit"],
        qty: json["qty"],
        isDelivered: json["is_delivered"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name_en": nameEn,
        "name_bn": nameBn,
        "description_en": descriptionEn,
        "description_bn": descriptionBn,
        "picture": picture,
        "price": price,
        "sale_price": salePrice,
        "unit": unit,
        "qty": qty,
        "is_delivered": isDelivered,
      };
}
