import 'dart:math';
import 'package:ecommerce_app/MVC/Controller/OtpController/OtpController.dart';
import 'package:ecommerce_app/Repository/MyRepository.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  MyRepository repository = MyRepository();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController loginPhoneNumber = TextEditingController();
  TextEditingController loginName = TextEditingController();
  TextEditingController loginAddress = TextEditingController();
  Random random = new Random();
  String otp = "";
  bool? dialogShow;

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

  void loginMethod() async {
    if (formKey.currentState!.validate()) {
      otp = (random.nextInt(900000) + 100000).toString();

      await repository.sentOtp(loginPhoneNumber.text, otp).then(
        (login) {
          if (login == true) {
            OtpController().currentText = otp;
            Get.toNamed(
              AppRoutes.OTP_PAGE,
            );
            loginPhoneNumber.clear();
            loginName.clear();
            loginAddress.clear();
          } else {
            //for testing purpose
            Get.toNamed(AppRoutes.OTP_PAGE);
          }
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
