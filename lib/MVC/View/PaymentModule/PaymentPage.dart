import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/MVC/Controller/CommonController.dart';
import 'package:ecommerce_app/MVC/Controller/PaymentController/paymentController.dart';
import 'package:ecommerce_app/MVC/View/PaymentModule/Components/SummaryCard.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:ecommerce_app/globalWidget.dart';
import 'package:flutter/material.dart';
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
  TextEditingController address = TextEditingController();
  String userAddress = "";
  String name = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadShared();
  }

  //Load Shared Preferences
  loadShared() async {
    userAddress = _commonController.getUserAddress();
    name = _commonController.getUserName();
    address.text = userAddress;
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
                    Text("Total   "),
                    Text(
                        " = ${_cartController.cartPageTotalPrice.toInt().toString().length > 6 ? "${_cartController.cartPageTotalPrice.toString().substring(0, 6)}.." : "${_commonController.isSwitched == false ? _cartController.cartPageTotalPrice.toStringAsFixed(2) : _commonController.convertNumber(_cartController.cartPageTotalPrice.toStringAsFixed(2).toString())}"}")
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 8.sp),
            //   child: Container(
            //     width: Get.width * 0.8,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text("Delivery Charge  "),
            //         Text(
            //             " = ${_cartController.cartPageTotalPrice.toInt().toString().length > 6 ? "${_cartController.cartPageTotalPrice.toString().substring(0, 6)}.." : "${_commonController.isSwitched == false ? _cartController.cartPageTotalPrice.toStringAsFixed(2) : _commonController.convertNumber(_cartController.cartPageTotalPrice.toStringAsFixed(2).toString())}"}")
            //       ],
            //     ),
            //   ),
            // ),
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
                      onPressed: () async {
                        if (address.text == userAddress) {
                          await _paymentController.sslCommerzGeneralCall();
                          // await _paymentController.sslCommerzGeneralCall();
                        } else {
                          print("change address also call");
                          await _paymentController.callSaveUser(address.text);
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
}
