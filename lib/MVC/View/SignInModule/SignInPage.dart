import 'package:ecommerce_app/MVC/Controller/SignInController/SignInController.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:ecommerce_app/Util/Language/LocalizationLanguage.dart';
import 'package:ecommerce_app/globalWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  SignInController _signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSignInScaffoldColor,
      body: Container(
        height: 820.h,
        width: 412.w,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 198.h,
                    width: 412.w,
                    child: Image.asset("images/signin_bc.png"),
                  ),
                  Positioned(
                    child: GlobalWidget.signInglobalAppBar(
                      title: "",
                      bgColor: Colors.transparent,
                      trailing: Text(""),
                    ),
                  ),
                  Positioned(
                    top: 110.h,
                    left: 20.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(LocalizationLanguage.SIGN_IN_TEXT.tr,
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                                fontFamily: "CircularStd",
                                fontStyle: FontStyle.normal,
                                fontSize: 24.sp),
                            textAlign: TextAlign.left),
                        SizedBox(
                          height: 5.h,
                        ),
                        Opacity(
                          opacity: 0.7035679817199707,
                          child: Text(
                            LocalizationLanguage.SIGN_IN__BAN_TEXT.tr,
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                                fontFamily: "CircularStd",
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: Get.height,
                width: Get.width,
                color: kWhiteColor,
                child: Form(
                  key: _signInController.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
                        child: GlobalWidget.textFormField(
                          controller: _signInController.loginPhoneNumber,
                          line: 1,
                          labelText: LocalizationLanguage.PHONE_NUM_TEXT.tr,
                          textInputType: TextInputType.number,
                          validator: (value) {
                            if (value!.trim().isEmpty)
                              return LocalizationLanguage.PHONE_NUM_TEXT_REQ.tr;
                            else
                              return null;
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
                        child: GlobalWidget.textFormField(
                          controller: _signInController.loginName,
                          line: 1,
                          labelText: LocalizationLanguage.NAME_TEXT.tr,
                          textInputType: TextInputType.text,
                          validator: (value) {
                            if (value!.trim().isEmpty)
                              return LocalizationLanguage
                                  .ENTER_NAME_REQ_TEXT.tr;
                            else
                              return null;
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                        child: GetBuilder<SignInController>(
                          builder: (_singInController) {
                            return InkWell(
                              onTap: () {
                                _signInController.loginMethod();
                              },
                              child: Container(
                                width: 372,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: (_signInController
                                                .loginName.text.isNotEmpty &&
                                            _signInController.loginPhoneNumber
                                                .text.isNotEmpty)
                                        ? kRedColor
                                        : Color(0xffbcbcbc)),
                                child: Center(
                                  child: Text(
                                      LocalizationLanguage.SIGN_IN_TEXT.tr,
                                      style: TextStyle(
                                          color: const Color(0xffffffff),
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "CircularStd",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.sp),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
