import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:ecommerce_app/globalWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sslcommerze/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerze/sslcommerz.dart';
import 'package:flutter_sslcommerze/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerze/model/SSLCurrencyType.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimaryColor,
          title: Text("Payment"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: ElevatedButton(
                style: GlobalWidget.buttonStyle(),
                child: Text("Pay now"),
                onPressed: () {
                  sslCommerzGeneralCall();
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: kRedColor,
                  minimumSize: Size(120.w, 50.h),
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                  ),
                ),
                child: Text("Cancel"),
                onPressed: () {
                  Get.offAndToNamed(AppRoutes.HOMEPAGE);
                },
              ),
            )
          ],
        ),
      ),
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
