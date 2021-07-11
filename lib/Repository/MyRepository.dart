import 'dart:io';
import 'package:ecommerce_app/ApiProvider/ApiClient.dart';
import 'package:ecommerce_app/ApiProvider/App_Exception.dart';
import 'package:ecommerce_app/MVC/Controller/CommonController.dart';
import 'package:ecommerce_app/MVC/Model/DemoModel/ProductModel.dart';
import 'package:ecommerce_app/MVC/Model/OrderHistoryModel/OrderHistoryModel.dart';
import 'package:ecommerce_app/MVC/Model/SaveDataVerifyOtpModel/saveDataverifyOtpModel.dart';
import 'package:ecommerce_app/MVC/Model/SaveOrderModel/saveOrderModel.dart';
import 'package:ecommerce_app/Util/AppUrl.dart';
import 'package:ecommerce_app/Util/Enums.dart';
import 'package:get/get.dart';

class MyRepository {
  final ApiClient apiClient = Get.find<ApiClient>();
  final CommonController _commonController = Get.find<CommonController>();

  Future<ProductModel?> productRepo() async {
    var res = await apiClient
        .request(AppUrl.productUrl, Method.GET, null, true)
        .catchError(_commonController.handleError);
    try {
      if (res.data != null) {
        String responseString = res.toString();
        print(responseString);
        return productModelFromJson(responseString);
      }
    } on SocketException {
      throw FetchDataException(
          "from repo internet", AppUrl.productUrl.toString());
    } catch (e) {
      print("ProductRepo :::${e.toString()}");
    }
  }

  Future<bool?> sentOtp(Map<String, dynamic> body) async {
    var res = await apiClient
        .request(AppUrl.sent_otpUrl, Method.POST, body, true)
        .catchError(_commonController.handleError);
    try {
      if (res.data != null) {
        String responseString = res.data;
        print(responseString);
        //for testing purpose
        return false;
      } else {
        //for testing purpose
        return true;
      }
    } catch (e) {
      print("sentOtp ::: ${e.toString()}");
    }
  }

  Future<SaveDataVerifyOtpModel?> saveDataVerifyOtp(String mobile) async {
    print(mobile);

    Map<String, dynamic> body = {
      "mobile": mobile,
      "token": _commonController.getDeviceId(),
      "os": Platform.isAndroid
          ? 3
          : Platform.isIOS
              ? 2
              : 1
    };
    var res = await apiClient
        .request(AppUrl.save_data_verifyUrl, Method.POST, body, true)
        .catchError(_commonController.handleError);

    try {
      if (res.data != null) {
        String responseString = res.data;
        print(responseString);
        return saveDataVerifyOtpModelFromJson(responseString);
      } else {
        return saveDataVerifyOtpModelFromJson(res.data.toString());
      }
    } catch (e) {
      print("saveDataVerifyOtp ::: ${e.toString()}");
    }
  }

  Future<bool?> saveUser(
      String user_id, String name, String mobile, String address) async {
    Map<String, dynamic> body = {
      "userid": user_id,
      "name": name,
      "mobile": mobile,
      "house": address,
      "os": Platform.isAndroid
          ? 3
          : Platform.isIOS
              ? 2
              : 1
    };
    var res = await apiClient
        .request(AppUrl.save_userUrl, Method.POST, body, true)
        .catchError(_commonController.handleError);
    try {
      if (res.data != null) {
        String responseString = res.data;
        print(responseString);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("saveUser ::: ${e.toString()}");
    }
  }

  Future<bool?> saveOrder(String user_id, String name, String mobile,
      String address, String totalPrice, List<OrderDetail> orderDetail) async {
    SaveOrderModel data = SaveOrderModel(
        userId: int.parse(user_id),
        productPrice: 230.00,
        mobile: mobile,
        house: address,
        name: name,
        os: Platform.isAndroid
            ? 3.toString()
            : Platform.isIOS
                ? 2.toString()
                : 1.toString(),
        totalPrice: double.parse(totalPrice),
        orderDetails: orderDetail.toList());

    Map<String, dynamic> body = data.toJson();
    print(body);
    var res = await apiClient
        .request(AppUrl.save_orderUrl, Method.POST, body, false)
        .catchError(_commonController.handleError);
    try {
      if (res.data != null) {
        String responseString = res.data;
        print(responseString);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("saveOrder ::: ${e.toString()}");
    }
  }

  Future<OrderHistoryModel?> orderHistory(String userId) async {
    print(userId);

    Map<String, dynamic> body = {
      "userid": userId,
    };
    var res = await apiClient
        .request(AppUrl.order_historyUrl, Method.POST, body, true)
        .catchError(_commonController.handleError);

    try {
      if (res.data != null) {
        String responseString = res.data;
        print(responseString);
        return orderHistoryModelFromJson(responseString);
      } else {
        return orderHistoryModelFromJson(res.data.toString());
      }
    } catch (e) {
      print("orderHistory ::: ${e.toString()}");
    }
  }

  Future<bool?> cancelOrderRepo(Map<String, dynamic> body) async {
    print("body of cancel order ::: " + body.toString());
    var res = await apiClient
        .request(AppUrl.order_cancelUrl, Method.POST, body, true)
        .catchError(_commonController.handleError);
    try {
      if (res.data != null) {
        String responseString = res.data;
        print(responseString);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("cancelOrderRepo ::: ${e.toString()}");
    }
  }
}
