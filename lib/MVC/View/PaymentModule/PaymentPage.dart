import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/MVC/Controller/CommonController.dart';
import 'package:ecommerce_app/MVC/Controller/PaymentController/paymentController.dart';
import 'package:ecommerce_app/MVC/View/PaymentModule/Component/SummaryCard.dart';
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
  CartController _cartController = Get.find<CartController>();
  CommonController _commonController = Get.find<CommonController>();
  PaymentController _paymentController = Get.put(PaymentController());
  dynamic pro;
  var userid;
  TextEditingController address = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pro = Get.arguments[0];
    userid = Get.arguments[1];
    address.text = pro["house"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text("Payment"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Center(
              child: Text(
                "Order Summary",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              width: Get.width,
              height: Get.height * 0.3,
              child: ListView.builder(
                itemCount: _cartController.carts.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: SummaryCard(cart: _cartController.carts[index]),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Container(
              width: Get.width * 0.9,
              color: Colors.black,
              height: 2,
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.sp),
              child: Container(
                width: Get.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Price  "),
                    Text(
                        " = ${_cartController.cartPageTotalPrice.toInt().toString().length > 6 ? "${_cartController.cartPageTotalPrice.toString().substring(0, 6)}.." : "${_commonController.isSwitched == false ? _cartController.cartPageTotalPrice.toStringAsFixed(2) : _commonController.convertNumber(_cartController.cartPageTotalPrice.toStringAsFixed(2).toString())}"}")
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
              ),
              child: GlobalWidget.textFormField(
                controller: address,
                line: 2,
                labelText: "Delivery Address",
                textInputType: TextInputType.text,
              ),
            ),
            SizedBox(
              height: Get.height * 0.08,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: ElevatedButton(
                      style: GlobalWidget.buttonStyle(),
                      child: Text("Pay now"),
                      onPressed: () {
                        if (address.text == pro["house"]) {
                          print("sslcommerze");
                          //sslCommerzGeneralCall();
                        } else {
                          _paymentController.callSaveUser(userid.toString(),
                              pro["name"], pro["mobile"], address.text);
                          //sslCommerzGeneralCall();
                          print("change address also call");
                        }
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
