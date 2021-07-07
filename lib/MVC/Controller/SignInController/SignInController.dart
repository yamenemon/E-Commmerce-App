import 'dart:math';
import 'package:ecommerce_app/Repository/MyRepository.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  MyRepository repository = MyRepository();

  TextEditingController loginPhoneNumber = TextEditingController();
  TextEditingController loginName = TextEditingController();
  TextEditingController loginAddress = TextEditingController();
  Random random = new Random();
  String otp = "";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loginPhoneNumber.addListener(() {
      update();
    });
    loginName.addListener(() {
      update();
    });
    loginAddress.addListener(() {
      update();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    loginPhoneNumber.dispose();
    loginName.dispose();
    loginAddress.dispose();
  }

  void loginMethod(GlobalKey<FormState> formkey) async {
    if (formkey.currentState!.validate()) {
      otp = (random.nextInt(900000) + 100000).toString();
      Map<String, dynamic> body = {"mobile": loginPhoneNumber.text, "otp": otp};
      await repository.sentOtp(body).then(
        (login) {
          Get.offAndToNamed(AppRoutes.OTP_PAGE, arguments: [
            otp,
            loginName.text,
            loginPhoneNumber.text,
            loginAddress.text
          ]);
          loginPhoneNumber.clear();
          loginName.clear();
          loginAddress.clear();
        },
      );
      print(otp);
      print(loginName.text);
      print(loginPhoneNumber.text);
      print(loginAddress.text);
    }
    update();
  }
}
