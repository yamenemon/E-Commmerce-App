// import 'dart:convert';

// List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
//     json.decode(str).map((x) => ProductModel.fromJson(x)));

// String productModelToJson(List<ProductModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ProductModel {
//   ProductModel(
//       {this.id,
//       this.title,
//       this.price,
//       this.description,
//       this.category,
//       this.image,
//       this.favourite});

//   int? id;
//   String? title;
//   double? price;
//   String? description;
//   String? category;
//   String? image;
//   bool? favourite;

//   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//         id: json["id"],
//         title: json["title"],
//         price: json["price"].toDouble(),
//         description: json["description"],
//         category: json["category"],
//         image: json["image"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "price": price,
//         "description": description,
//         "category": category,
//         "image": image,
//       };
// }

// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

// import 'dart:convert';

// ProductModel productModelFromJson(String str) =>
//     ProductModel.fromJson(json.decode(str));

// String productModelToJson(ProductModel data) => json.encode(data.toJson());

// class ProductModel {
//   ProductModel({
//     this.status,
//     this.msg,
//     this.contact,
//     this.deliveryCharge,
//     this.products,
//     this.categories,
//     this.orders,
//     this.profile,
//     this.offer,
//     this.offerList,
//   });

//   int? status;
//   String? msg;
//   String? contact;
//   int? deliveryCharge;
//   List<Product>? products;
//   List<Category>? categories;
//   dynamic orders;
//   dynamic profile;
//   dynamic offer;
//   List<OfferList>? offerList;

//   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//         status: json["status"] == null ? null : json["status"],
//         msg: json["msg"] == null ? null : json["msg"],
//         contact: json["contact"] == null ? null : json["contact"],
//         deliveryCharge:
//             json["delivery_charge"] == null ? null : json["delivery_charge"],
//         products: json["products"] == null
//             ? null
//             : List<Product>.from(
//                 json["products"].map((x) => Product.fromJson(x))),
//         categories: json["categories"] == null
//             ? null
//             : List<Category>.from(
//                 json["categories"].map((x) => Category.fromJson(x))),
//         orders: json["orders"],
//         profile: json["profile"],
//         offer: json["offer"],
//         offerList: json["offer_list"] == null
//             ? null
//             : List<OfferList>.from(
//                 json["offer_list"].map((x) => OfferList.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status == null ? null : status,
//         "msg": msg == null ? null : msg,
//         "contact": contact == null ? null : contact,
//         "delivery_charge": deliveryCharge == null ? null : deliveryCharge,
//         "products": products == null
//             ? null
//             : List<dynamic>.from(products!.map((x) => x.toJson())),
//         "categories": categories == null
//             ? null
//             : List<dynamic>.from(categories!.map((x) => x.toJson())),
//         "orders": orders,
//         "profile": profile,
//         "offer": offer,
//         "offer_list": offerList == null
//             ? null
//             : List<dynamic>.from(offerList!.map((x) => x.toJson())),
//       };
// }

// class Category {
//   Category({
//     this.id,
//     this.index,
//     this.nameEn,
//     this.nameBn,
//     this.appImage,
//     this.isSelected,
//   });

//   int? id;
//   int? index;
//   String? nameEn;
//   String? nameBn;
//   String? appImage;
//   bool? isSelected;

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"] == null ? null : json["id"],
//         index: json["index"] == null ? null : json["index"],
//         nameEn: json["name_en"] == null ? null : json["name_en"],
//         nameBn: json["name_bn"] == null ? null : json["name_bn"],
//         appImage: json["app_image"] == null ? null : json["app_image"],
//         isSelected: json["is_selected"] == null ? null : json["is_selected"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "index": index == null ? null : index,
//         "name_en": nameEn == null ? null : nameEn,
//         "name_bn": nameBn == null ? null : nameBn,
//         "app_image": appImage == null ? null : appImage,
//         "is_selected": isSelected == null ? null : isSelected,
//       };
// }

// class OfferList {
//   OfferList({
//     this.id,
//     this.title,
//     this.description,
//     this.image,
//     this.productId,
//     this.categoryId,
//     this.offerStart,
//     this.offerEnd,
//     this.amount,
//     this.isPercentage,
//   });

//   int? id;
//   String? title;
//   String? description;
//   String? image;
//   String? productId;
//   String? categoryId;
//   String? offerStart;
//   String? offerEnd;
//   int? amount;
//   bool? isPercentage;

//   factory OfferList.fromJson(Map<String, dynamic> json) => OfferList(
//         id: json["id"] == null ? null : json["id"],
//         title: json["title"] == null ? null : json["title"],
//         description: json["description"] == null ? null : json["description"],
//         image: json["image"] == null ? null : json["image"],
//         productId: json["product_id"] == null ? null : json["product_id"],
//         categoryId: json["category_id"] == null ? null : json["category_id"],
//         offerStart: json["offer_start"] == null ? null : json["offer_start"],
//         offerEnd: json["offer_end"] == null ? null : json["offer_end"],
//         amount: json["amount"] == null ? null : json["amount"],
//         isPercentage:
//             json["is_percentage"] == null ? null : json["is_percentage"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "title": title == null ? null : title,
//         "description": description == null ? null : description,
//         "image": image == null ? null : image,
//         "product_id": productId == null ? null : productId,
//         "category_id": categoryId == null ? null : categoryId,
//         "offer_start": offerStart == null ? null : offerStart,
//         "offer_end": offerEnd == null ? null : offerEnd,
//         "amount": amount == null ? null : amount,
//         "is_percentage": isPercentage == null ? null : isPercentage,
//       };
// }

// class Product {
//   Product({
//     this.productId,
//     this.categoryId,
//     this.index,
//     this.nameEn,
//     this.nameBn,
//     this.descriptionEn,
//     this.descriptionBn,
//     this.price,
//     this.salePrice,
//     this.isDiscount,
//     this.amount,
//     this.isPercentage,
//     this.unit,
//     this.picture,
//     this.sliderImage,
//     this.image2,
//     this.image3,
//     this.stock,
//     this.status,
//   });

//   int? productId;
//   int? categoryId;
//   int? index;
//   String? nameEn;
//   String? nameBn;
//   String? descriptionEn;
//   String? descriptionBn;
//   int? price;
//   int? salePrice;
//   int? isDiscount;
//   int? amount;
//   int? isPercentage;
//   String? unit;
//   String? picture;
//   dynamic sliderImage;
//   dynamic image2;
//   dynamic image3;
//   int? stock;
//   int? status;

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         productId: json["product_id"] == null ? null : json["product_id"],
//         categoryId: json["category_id"] == null ? null : json["category_id"],
//         index: json["index"] == null ? null : json["index"],
//         nameEn: json["name_en"] == null ? null : json["name_en"],
//         nameBn: json["name_bn"] == null ? null : json["name_bn"],
//         descriptionEn:
//             json["description_en"] == null ? null : json["description_en"],
//         descriptionBn:
//             json["description_bn"] == null ? null : json["description_bn"],
//         price: json["price"] == null ? null : json["price"],
//         salePrice: json["sale_price"] == null ? null : json["sale_price"],
//         isDiscount: json["is_discount"] == null ? null : json["is_discount"],
//         amount: json["amount"] == null ? null : json["amount"],
//         isPercentage:
//             json["is_percentage"] == null ? null : json["is_percentage"],
//         unit: json["unit"] == null ? null : json["unit"],
//         picture: json["picture"] == null ? null : json["picture"],
//         sliderImage: json["slider_image"],
//         image2: json["image2"],
//         image3: json["image3"],
//         stock: json["stock"] == null ? null : json["stock"],
//         status: json["status"] == null ? null : json["status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "product_id": productId == null ? null : productId,
//         "category_id": categoryId == null ? null : categoryId,
//         "index": index == null ? null : index,
//         "name_en": nameEn == null ? null : nameEn,
//         "name_bn": nameBn == null ? null : nameBn,
//         "description_en": descriptionEn == null ? null : descriptionEn,
//         "description_bn": descriptionBn == null ? null : descriptionBn,
//         "price": price == null ? null : price,
//         "sale_price": salePrice == null ? null : salePrice,
//         "is_discount": isDiscount == null ? null : isDiscount,
//         "amount": amount == null ? null : amount,
//         "is_percentage": isPercentage == null ? null : isPercentage,
//         "unit": unit == null ? null : unit,
//         "picture": picture == null ? null : picture,
//         "slider_image": sliderImage,
//         "image2": image2,
//         "image3": image3,
//         "stock": stock == null ? null : stock,
//         "status": status == null ? null : status,
//       };
// }

// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.status,
    this.msg,
    this.contact,
    this.deliveryCharge,
    this.products,
    this.categories,
    this.orders,
    this.profile,
    this.offer,
    this.offerList,
  });

  int? status;
  String? msg;
  String? contact;
  int? deliveryCharge;
  List<Product>? products;
  List<Category>? categories;
  dynamic orders;
  dynamic profile;
  dynamic offer;
  List<OfferList>? offerList;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json["status"],
        msg: json["msg"],
        contact: json["contact"],
        deliveryCharge: json["delivery_charge"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        orders: json["orders"],
        profile: json["profile"],
        offer: json["offer"],
        offerList: List<OfferList>.from(
            json["offer_list"].map((x) => OfferList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "contact": contact,
        "delivery_charge": deliveryCharge,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
        "orders": orders,
        "profile": profile,
        "offer": offer,
        "offer_list": List<dynamic>.from(offerList!.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.id,
    this.index,
    this.nameEn,
    this.nameBn,
    this.appImage,
    this.isSelected,
  });

  int? id;
  int? index;
  String? nameEn;
  String? nameBn;
  String? appImage;
  bool? isSelected;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        index: json["index"],
        nameEn: json["name_en"],
        nameBn: json["name_bn"],
        appImage: json["app_image"] == null ? null : json["app_image"],
        isSelected: json["is_selected"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "index": index,
        "name_en": nameEn,
        "name_bn": nameBn,
        "app_image": appImage == null ? null : appImage,
        "is_selected": isSelected,
      };
}

class OfferList {
  OfferList({
    this.id,
    this.title,
    this.description,
    this.image,
    this.productId,
    this.categoryId,
    this.offerStart,
    this.offerEnd,
    this.amount,
    this.isPercentage,
  });

  int? id;
  String? title;
  String? description;
  String? image;
  String? productId;
  String? categoryId;
  String? offerStart;
  String? offerEnd;
  int? amount;
  bool? isPercentage;

  factory OfferList.fromJson(Map<String, dynamic> json) => OfferList(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        productId: json["product_id"],
        categoryId: json["category_id"],
        offerStart: json["offer_start"],
        offerEnd: json["offer_end"],
        amount: json["amount"],
        isPercentage: json["is_percentage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "product_id": productId,
        "category_id": categoryId,
        "offer_start": offerStart,
        "offer_end": offerEnd,
        "amount": amount,
        "is_percentage": isPercentage,
      };
}

class Product {
  Product({
    this.productId,
    this.categoryId,
    this.index,
    this.nameEn,
    this.nameBn,
    this.descriptionEn,
    this.descriptionBn,
    this.price,
    this.salePrice,
    this.isDiscount,
    this.amount,
    this.isPercentage,
    this.unit,
    this.picture,
    this.sliderImage,
    this.image2,
    this.image3,
    this.stock,
    this.status,
  });

  int? productId;
  int? categoryId;
  int? index;
  String? nameEn;
  String? nameBn;
  String? descriptionEn;
  String? descriptionBn;
  int? price;
  int? salePrice;
  int? isDiscount;
  int? amount;
  int? isPercentage;
  String? unit;
  String? picture;
  dynamic sliderImage;
  dynamic image2;
  dynamic image3;
  int? stock;
  int? status;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        categoryId: json["category_id"],
        index: json["index"],
        nameEn: json["name_en"],
        nameBn: json["name_bn"],
        descriptionEn: json["description_en"],
        descriptionBn: json["description_bn"],
        price: json["price"],
        salePrice: json["sale_price"],
        isDiscount: json["is_discount"],
        amount: json["amount"],
        isPercentage: json["is_percentage"],
        unit: json["unit"],
        picture: json["picture"],
        sliderImage: json["slider_image"],
        image2: json["image2"],
        image3: json["image3"],
        stock: json["stock"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "category_id": categoryId,
        "index": index,
        "name_en": nameEn,
        "name_bn": nameBn,
        "description_en": descriptionEn,
        "description_bn": descriptionBn,
        "price": price,
        "sale_price": salePrice,
        "is_discount": isDiscount,
        "amount": amount,
        "is_percentage": isPercentage,
        "unit": unit,
        "picture": picture,
        "slider_image": sliderImage,
        "image2": image2,
        "image3": image3,
        "stock": stock,
        "status": status,
      };
}
