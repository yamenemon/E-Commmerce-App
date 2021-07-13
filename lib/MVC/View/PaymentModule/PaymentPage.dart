import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/MVC/Controller/CommonController.dart';
import 'package:ecommerce_app/MVC/Controller/ProductModule/GetController.dart';
import 'package:ecommerce_app/MVC/Controller/PaymentModule/paymentController.dart';
import 'package:ecommerce_app/MVC/View/PaymentModule/Components/SummaryCard.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:ecommerce_app/GlobalWidget/globalWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final CartController _cartController = Get.find<CartController>();
  final CommonController _commonController = Get.find<CommonController>();
  final PaymentController _paymentController = Get.put(PaymentController());
  final GetController _getController = Get.find<GetController>();
  final TextEditingController address = TextEditingController();
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
    double deliveryCharge =
        _getController.getModelList.value.deliveryCharge?.toDouble() ?? 0.0;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text("Payment"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              Center(
                child: Text("Order Summary",
                    style: Theme.of(context).textTheme.headline6),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                width: Get.width,
                height: Get.height * 0.3,
                child: ListView.builder(
                    itemCount: _cartController.carts.length,
                    itemBuilder: (context, index) {
                      double totalPrice =
                          _cartController.cartPageTotalDiscount.value +
                              deliveryCharge;
                      print(totalPrice);
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: SummaryCard(cart: _cartController.carts[index]),
                      );
                    }),
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
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        flex: 3, child: Container(child: Text("SubTotal"))),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text(
                          "= ${_commonController.isSwitched == false ? _cartController.cartPageTotalPrice.ceil().toDouble().toStringAsFixed(2) : _commonController.convertNumber(_cartController.cartPageTotalPrice.value.ceil().toDouble().toString())}",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Text("Delivery Charge"),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text(
                            "= ${deliveryCharge.toDouble().toStringAsFixed(2)}",
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                    )
                  ],
                ),
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
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: () {
                          _cartController
                              .totalPriceWithDelivery(deliveryCharge);
                          print(_cartController.cartPageTotalPrice.value);
                        },
                        child: Container(
                          child: Text("Total"),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text(
                            "= ${_commonController.isSwitched == false ? _cartController.totalPriceWithDelivery(deliveryCharge).ceil().toStringAsFixed(2) : _commonController.convertNumber(_cartController.totalPriceWithDelivery(deliveryCharge).ceil().toStringAsFixed(2))}",
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
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
                height: Get.height * 0.02,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.r)),
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
      ),
    );
  }
}
