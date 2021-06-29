import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController loginPhoneNumber = TextEditingController();
  TextEditingController loginName = TextEditingController();
  bool obscureText = true;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // loginPhoneNumber.text = "Hello input our number";
    // loginPassword.text = "Input your Password";
    loginPhoneNumber.addListener(() {
      update();
    });
    loginName.addListener(() {
      update();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    loginPhoneNumber.dispose();
    loginName.dispose();
  }

  void loginMethod() {
    Get.toNamed(AppRoutes.OTP_PAGE);
    // if (formKey.currentState!.validate()) {
    //   Get.toNamed(AppRoutes.OTP_PAGE);
    //   print(loginPhoneNumber.text);
    //   print(loginName.text);
    // }
  }
}
