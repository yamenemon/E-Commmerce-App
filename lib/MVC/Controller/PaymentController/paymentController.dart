import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/MVC/Model/SaveOrderModel/saveOrderModel.dart';
import 'package:ecommerce_app/Repository/MyRepository.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sslcommerze/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerze/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerze/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerze/sslcommerz.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentController extends GetxController {
  MyRepository repository = MyRepository();
  List<OrderDetail> orderDetail = [];
  final CartController _cartController = Get.find<CartController>();

  callSaveUser(
      String userId, String name, String mobile, String address) async {
    await repository.saveUser(userId.toString(), name, mobile, address).then(
      (saveUser) {
        if (saveUser == true) {
          print("Change Adress");
          saveOrderMethod(userId, name, mobile, address);
        }
      },
    );
  }

  saveOrderMethod(
    String userId,
    String name,
    String mobile,
    String address,
  ) async {
    _cartController.carts.forEach((element) {
      orderDetail.add(OrderDetail(
          productId: element.productDemoModel.productId,
          price: double.parse(element.productDemoModel.price.toString()),
          productQty: element.quantity,
          productSalePrice: element.productDemoModel.salePrice,
          productUnit: element.productDemoModel.unit));
    });
    await repository
        .saveOrder(userId.toString(), name, mobile, address,
            _cartController.cartPageTotalPrice.toStringAsFixed(2), orderDetail)
        .then(
      (saveOrder) {
        if (saveOrder == true) {
          _cartController.carts.clear();
          Get.defaultDialog(
              title: "Order",
              titleStyle: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              middleText: "Your Order is Successfully Done",
              middleTextStyle: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              onConfirm: () {
                Get.offAndToNamed(AppRoutes.HOMEPAGE);
              });
        } else {
          Get.defaultDialog(
              title: "Error",
              titleStyle: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              middleText: "Something Went Wrong",
              middleTextStyle: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              onConfirm: () {
                Get.back();
              });
        }
      },
    );
  }

  Future<void> sslCommerzGeneralCall() async {
    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
          //Use the ipn if you have valid one, or it will fail the transaction.
          ipn_url: "www.ipnurl.com",
          multi_card_name: "no",
          currency: SSLCurrencyType.BDT,
          product_category: "Food",
          sdkType: SSLCSdkType.LIVE,
          store_id: "demotest",
          store_passwd: "qwerty",
          total_amount: 10,
          tran_id: "1231321321321312"),
    );
    sslcommerz.payNow();
  }
}
