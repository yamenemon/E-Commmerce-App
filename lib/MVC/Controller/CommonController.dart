import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:ecommerce_app/ApiProvider/App_Exception.dart';
import 'package:ecommerce_app/Util/Language/Translation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonController extends GetxController {
  bool isSwitched = false;
  static String USER_ID = "user_id";
  static String USER_NAME = "user_name";
  static String USER_ADDRESS = "user_address";
  static String USER_MOBILE = "user_mobile";
  late SharedPreferences sharedPreferences;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initSharedPref();
  }

  //initialize Shared Pref Instances
  initSharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  String convertNumber(String eng) {
    String bengali = '';
    for (int i = 0; i < eng.length; i++) {
      switch (eng[i]) {
        case '0':
          bengali = bengali + '০';
          break;
        case '1':
          bengali = bengali + '১';
          break;
        case '2':
          bengali = bengali + '২';
          break;
        case '3':
          bengali = bengali + '৩';
          break;
        case '4':
          bengali = bengali + '৪';
          break;
        case '5':
          bengali = bengali + '৫';
          break;
        case '6':
          bengali = bengali + '৬';
          break;
        case '7':
          bengali = bengali + '৭';
          break;
        case '8':
          bengali = bengali + '৮';
          break;
        case '9':
          bengali = bengali + '৯';
          break;
        default:
          bengali = bengali + '.';
      }
      update();
    }
    return bengali;
  }

  void changeLocaleMethod(bool value) {
    isSwitched = value;
    LocalizationService().changeLocale(isSwitched);
  }

  void handleError(error) {
    if (error is BadRequestException) {
      var message = error.message;
      showDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      showDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      var message = error.message;
      showDialog(description: "Oops!! It took longer to respond");
    }
  }

  void showDialog({
    String title = "Error",
    String description = "Something went wrong",
  }) {
    Get.defaultDialog(
        title: title,
        titleStyle: Get.textTheme.headline4,
        content: Text(description, style: Get.textTheme.headline4),
        onConfirm: () {
          Get.back();
        });
  }

  Future<String> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  //SharedPreferences set User Id
  storeUserId(String userId) async {
    sharedPreferences.setString(USER_ID, userId);
    update();
  }

  //SharedPreferences get user Id
  String getUserId() {
    String userId = sharedPreferences.getString(USER_ID) ?? "0";
    update();
    print("Shared UserId " + userId);
    return userId;
  }

  //SharedPreferences set User Name
  storeName(String name) async {
    sharedPreferences.setString(USER_NAME, name);
    update();
  }

  //SharedPreferences get user Name
  String getUserName() {
    String userName = sharedPreferences.getString(USER_NAME) ?? " ";
    update();
    print("Shared UserName " + userName);
    return userName;
  }

  //SharedPreferences set User Address
  storeUserAddress(String address) async {
    sharedPreferences.setString(USER_ADDRESS, address);
    update();
  }

  //SharedPreferences get user Address
  String getUserAddress() {
    String userAddress = sharedPreferences.getString(USER_ADDRESS) ?? " ";
    update();
    print("Shared UserAddress " + userAddress);
    return userAddress;
  }

  //SharedPreferences set User Address
  storeMobileNumber(String mobile) async {
    sharedPreferences.setString(USER_MOBILE, mobile);
    update();
  }

  //SharedPreferences get user Address
  String getUserMobile() {
    String userMobile = sharedPreferences.getString(USER_MOBILE) ?? " ";
    update();
    print("Shared UserAddress " + userMobile);
    return userMobile;
  }
}
