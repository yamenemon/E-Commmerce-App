import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:ecommerce_app/ApiProvider/App_Exception.dart';
import 'package:ecommerce_app/Util/Language/Translation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CommonController extends GetxController {
  bool isSwitched = false;

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
}
