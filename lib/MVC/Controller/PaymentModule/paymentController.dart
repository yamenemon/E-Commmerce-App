import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/MVC/Controller/CommonController.dart';
import 'package:ecommerce_app/MVC/Controller/ProductModule/GetController.dart';
import 'package:ecommerce_app/MVC/Model/SaveOrderModule/saveOrderModel.dart';
import 'package:ecommerce_app/Repository/MyRepository.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sslcommerze/model/SSLCAdditionalInitializer.dart';
import 'package:flutter_sslcommerze/model/SSLCCustomerInfoInitializer.dart';
import 'package:flutter_sslcommerze/model/SSLCEMITransactionInitializer.dart';
import 'package:flutter_sslcommerze/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerze/model/SSLCShipmentInfoInitializer.dart';
import 'package:flutter_sslcommerze/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerze/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerze/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerze/model/sslproductinitilizer/General.dart';
import 'package:flutter_sslcommerze/model/sslproductinitilizer/SSLCProductInitializer.dart';
import 'package:flutter_sslcommerze/sslcommerz.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentController extends GetxController {
  MyRepository repository = MyRepository();
  List<OrderDetail> orderDetail = [];
  final CartController _cartController = Get.find<CartController>();
  final CommonController _commonController = Get.find<CommonController>();
  final GetController _getController = Get.find<GetController>();

  callSaveUser(String address) async {
    await repository
        .saveUser(
            _commonController.getUserId(),
            _commonController.getUserName(),
            _commonController.getUserMobile(),
            address)
        .then(
      (saveUser) {
        if (saveUser == true) {
          _commonController.storeUserAddress(address);
          print("Change Adress");
          // saveOrderMethod();
          sslCommerzGeneralCall();
          //sslCommerzCustomizedCall();
        }
      },
    );
  }

  Future<void> sslCommerzGeneralCall() async {
    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
          //Use the ipn if you have valid one, or it will fail the transaction.
          ipn_url: "www.ipnurl.com",
          multi_card_name: null,
          currency: SSLCurrencyType.BDT,
          product_category: "Food",
          sdkType: SSLCSdkType.TESTBOX,
          store_id: "testbox",
          store_passwd: "qwerty",
          total_amount: _cartController.cartPageTotalWithDiscountPrice.value
              .ceil()
              .toDouble(),
          tran_id: "1231321321321312"),
    );
    var result = await sslcommerz.payNow();
    if (result is PlatformException) {
      print("the response is: " +
          result.message.toString() +
          " code: " +
          result.code);
    } else {
      SSLCTransactionInfoModel model = result;
      if (double.parse(model.amount.toString()) >=
          _cartController.cartPageTotalPrice.value.ceil().toDouble()) {
        print("Successfully Completed : " + model.amount.toString());
        saveOrderMethod();
      } else {
        Get.defaultDialog(
            title: "Order Error",
            middleText:
                "Your Order is Not Successfull, Please Check Your Transaction Related Issue",
            onConfirm: () => Get.back());
      }
    }
  }

  // Future<void> sslCommerzCustomizedCall() async {
  //   Sslcommerz sslcommerz = Sslcommerz(
  //       initializer: SSLCommerzInitialization(
  //           //Use the ipn if you have valid one, or it will fail the transaction.
  //           ipn_url: "www.ipnurl.com",
  //           multi_card_name: null,
  //           currency: SSLCurrencyType.BDT,
  //           product_category: "Food",
  //           sdkType: SSLCSdkType.LIVE,
  //           store_id: "demotest",
  //           store_passwd: "qwerty",
  //           total_amount: 10,
  //           tran_id: "1231321321321312"));
  //   sslcommerz
  //       .addEMITransactionInitializer(
  //           sslcemiTransactionInitializer: SSLCEMITransactionInitializer(
  //               emi_options: 1, emi_max_list_options: 3, emi_selected_inst: 2))
  //       .addShipmentInfoInitializer(
  //           sslcShipmentInfoInitializer: SSLCShipmentInfoInitializer(
  //               shipmentMethod: "yes",
  //               numOfItems: 5,
  //               shipmentDetails: ShipmentDetails(
  //                   shipAddress1: "Ship address 1",
  //                   shipCity: "Faridpur",
  //                   shipCountry: "Bangladesh",
  //                   shipName: "Ship name 1",
  //                   shipPostCode: "7860")))
  //       .addCustomerInfoInitializer(
  //           customerInfoInitializer: SSLCCustomerInfoInitializer(
  //               customerState: "Chattogram",
  //               customerName: "Abu Sayed Chowdhury",
  //               customerEmail: "sayem227@gmail.com",
  //               customerAddress1: "Anderkilla",
  //               customerCity: "Chattogram",
  //               customerPostCode: "200",
  //               customerCountry: "Bangladesh",
  //               customerPhone: ""))
  //       .addProductInitializer(
  //           sslcProductInitializer:
  //               // ***** ssl product initializer for general product STARTS*****
  //               SSLCProductInitializer(
  //                   productName: "Water Filter",
  //                   productCategory: "Widgets",
  //                   general: General(
  //                       general: "General Purpose",
  //                       productProfile: "Product Profile"))
  //           // ***** ssl product initializer for general product ENDS*****

  //           // ***** ssl product initializer for non physical goods STARTS *****
  //           // SSLCProductInitializer.WithNonPhysicalGoodsProfile(
  //           //     productName:
  //           //   "productName",
  //           //   productCategory:
  //           //   "productCategory",
  //           //   nonPhysicalGoods:
  //           //   NonPhysicalGoods(
  //           //      productProfile:
  //           //       "Product profile",
  //           //     nonPhysicalGoods:
  //           //     "non physical good"
  //           //       ))
  //           // ***** ssl product initializer for non physical goods ENDS *****

  //           // ***** ssl product initialization for travel vertices STARTS *****
  //           //       SSLCProductInitializer.WithTravelVerticalProfile(
  //           //          productName:
  //           //         "productName",
  //           //         productCategory:
  //           //         "productCategory",
  //           //         travelVertical:
  //           //         TravelVertical(
  //           //               productProfile: "productProfile",
  //           //               hotelName: "hotelName",
  //           //               lengthOfStay: "lengthOfStay",
  //           //               checkInTime: "checkInTime",
  //           //               hotelCity: "hotelCity"
  //           //             )
  //           //       )
  //           // ***** ssl product initialization for travel vertices ENDS *****

  //           // ***** ssl product initialization for physical goods STARTS *****

  //           // SSLCProductInitializer.WithPhysicalGoodsProfile(
  //           //     productName: "productName",
  //           //     productCategory: "productCategory",
  //           //     physicalGoods: PhysicalGoods(
  //           //         productProfile: "Product profile",
  //           //         physicalGoods: "non physical good"))

  //           // ***** ssl product initialization for physical goods ENDS *****

  //           // ***** ssl product initialization for telecom vertice STARTS *****
  //           // SSLCProductInitializer.WithTelecomVerticalProfile(
  //           //     productName: "productName",
  //           //     productCategory: "productCategory",
  //           //     telecomVertical: TelecomVertical(
  //           //         productProfile: "productProfile",
  //           //         productType: "productType",
  //           //         topUpNumber: "topUpNumber",
  //           //         countryTopUp: "countryTopUp"))
  //           // ***** ssl product initialization for telecom vertice ENDS *****
  //           )
  //       .addAdditionalInitializer(
  //           sslcAdditionalInitializer: SSLCAdditionalInitializer(
  //               valueA: "value a ",
  //               valueB: "value b",
  //               valueC: "value c",
  //               valueD: "value d"));
  //   var result = await sslcommerz.payNow();
  //   if (result is PlatformException) {
  //     print("the response is: " +
  //         result.message.toString() +
  //         " code: " +
  //         result.code);
  //   } else {
  //     SSLCTransactionInfoModel model = result;
  //   }
  // }

  saveOrderMethod() async {
    _cartController.carts.forEach((element) {
      orderDetail.add(OrderDetail(
          productId: element.productDemoModel.productId,
          price: double.parse(element.productDemoModel.price.toString()),
          productQty: element.quantity,
          productSalePrice: element.productDemoModel.salePrice,
          productUnit: element.productDemoModel.unit));
    });
    await repository
        .saveOrder(
      _commonController.getUserId(),
      _commonController.getUserName(),
      _commonController.getUserMobile(),
      _commonController.getUserAddress(),
      orderDetail,
      _cartController.productPrice.value,
      _getController.getModelList.value.deliveryCharge?.toDouble() ?? 0.0,
      _cartController.cartPageTotalDiscount.value.ceil().toDouble(),
      _cartController.cartPageTotalWithDiscountPrice.value.ceil().toDouble(),
    )
        .then(
      (saveOrder) {
        if (saveOrder == true) {
          _cartController.carts.clear();
          Get.defaultDialog(
              title: "Order",
              barrierDismissible: false,
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
                Get.offAllNamed(AppRoutes.HOMEPAGE);
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
            },
          );
        }
      },
    );
  }
}
