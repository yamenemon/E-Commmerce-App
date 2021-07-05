import 'dart:io';
import 'package:ecommerce_app/ApiProvider/ApiClient.dart';
import 'package:ecommerce_app/MVC/Controller/CommonController.dart';
import 'package:ecommerce_app/MVC/Model/DemoModel/ProductModel.dart';
import 'package:ecommerce_app/MVC/Model/SaveDataVerifyOtpModel/saveDataverifyOtpModel.dart';
import 'package:ecommerce_app/Util/AppUrl.dart';
import 'package:ecommerce_app/Util/Enums.dart';
import 'package:get/get.dart';

class MyRepository {
  final ApiClient apiClient = Get.find<ApiClient>();
  final CommonController commonController = Get.find<CommonController>();

  // MyRepository({required this.apiClient}) : assert(apiClient != null);
  //List type data fetch
  // Future<List<ProductModel>?> getRepo() async {
  //   var res = await apiClient.request(AppUrl.productUrl, Method.GET, null);
  //   try {
  //     if (res.data != null) {
  //       return productModelFromJson(json.encode(res.data).toString());
  //     }
  //   } catch (e) {
  //     print("getRepo ::: ${e.toString()}");
  //   }
  // }
  Future<ProductModel?> productRepo() async {
    var res = await apiClient
        .request(AppUrl.productUrl, Method.GET, null)
        .catchError(CommonController.handleError);
    try {
      if (res.data != null) {
        String responseString = res.toString();
        print(responseString);
        return productModelFromJson(responseString);
      }
    } catch (e) {
      print("productRepo ::: ${e.toString()}");
    }
  }

  Future<bool?> sentOtp(String mobile, String otp) async {
    print(otp);
    print(mobile);
    Map<String, dynamic> body = {"mobile": mobile, "otp": otp};
    // dynamic formData = DIO.FormData.fromMap(body);
    var res = await apiClient
        .request(AppUrl.sent_otpUrl, Method.POST, body)
        .catchError(CommonController.handleError);
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
      "token": commonController.getDeviceId(),
      "os": Platform.isAndroid
          ? 3
          : Platform.isIOS
              ? 2
              : 1
    };
    var res = await apiClient
        .request(AppUrl.save_data_verifyUrl, Method.POST, body)
        .catchError(CommonController.handleError);

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
    print(user_id);
    print(name);
    print(mobile);
    print(address);
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
        .request(AppUrl.save_userUrl, Method.POST, body)
        .catchError(CommonController.handleError);
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
}
