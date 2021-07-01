import 'package:ecommerce_app/MVC/Controller/SignInController/SignInController.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:ecommerce_app/Util/Language/LocalizationLanguage.dart';
import 'package:ecommerce_app/globalWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final SignInController _signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: kWhiteColor,
      body: Column(
        children: [
          Container(
            color: kSignInScaffoldColor,
            child: Stack(
              children: [
                Container(
                  height: 198.h,
                  width: 412.w,
                  child: Image.asset(
                    "images/signin_bc.png",
                    // width: Get.width,
                    // height: Get.height * 0.23,
                  ),
                ),
                Positioned(
                  child: GlobalWidget.signInglobalAppBar(
                    title: "",
                    bgColor: Colors.transparent,
                    trailing: const Text(""),
                  ),
                ),
                Positioned(
                  top: 110.h,
                  left: 20.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LocalizationLanguage.SIGN_IN_TEXT.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                          textAlign: TextAlign.left),
                      SizedBox(
                        height: 5.h,
                      ),
                      Opacity(
                        opacity: 0.7035679817199707,
                        child: Text(
                          LocalizationLanguage.SIGN_IN__BAN_TEXT.tr,
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                // height: Get.height,
                // width: Get.width,
                color: kWhiteColor,
                child: Column(
                  children: [
                    Form(
                      key: _signInController.formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 15.h),
                            child: GlobalWidget.textFormField(
                              controller: _signInController.loginName,
                              line: 1,
                              labelText: LocalizationLanguage.NAME_TEXT.tr,
                              textInputType: TextInputType.text,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return LocalizationLanguage
                                      .ENTER_NAME_REQ_TEXT.tr;
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 10.h),
                            child: GlobalWidget.textFormField(
                              controller: _signInController.loginPhoneNumber,
                              line: 1,
                              labelText: LocalizationLanguage.PHONE_NUM_TEXT.tr,
                              textInputType: TextInputType.number,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return LocalizationLanguage
                                      .PHONE_NUM_TEXT_REQ.tr;
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 10.h),
                            child: GlobalWidget.textFormField(
                              controller: _signInController.loginAddress,
                              line: 5,
                              labelText: LocalizationLanguage.ADDRESS_TEXT.tr,
                              textInputType: TextInputType.text,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return LocalizationLanguage
                                      .ADDRESS_TEXT_REQ.tr;
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 20.h),
                            child: GetBuilder<SignInController>(
                              builder: (_singInController) {
                                return InkWell(
                                  onTap: () {
                                    _signInController.loginMethod();
                                  },
                                  child: Container(
                                    width: Get.width - 40.w,
                                    height: globalBtnHeight,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        color:
                                            (_signInController.loginName.text
                                                        .isNotEmpty &&
                                                    _signInController
                                                        .loginPhoneNumber
                                                        .text
                                                        .isNotEmpty &&
                                                    _signInController
                                                        .loginAddress
                                                        .text
                                                        .isNotEmpty)
                                                ? kPrimaryColor
                                                : const Color(0xffbcbcbc)),
                                    child: Center(
                                      child: Text(
                                          LocalizationLanguage.SIGN_IN_TEXT.tr,
                                          style: GoogleFonts.poppins(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
