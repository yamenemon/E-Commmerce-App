import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/MVC/Controller/CommonController.dart';
import 'package:ecommerce_app/MVC/View/AccoutModule/Components/ProfileWidget.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/Language/LocalizationLanguage.dart';
import 'package:ecommerce_app/GlobalWidget/globalWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AcccountPage extends StatelessWidget {
  AcccountPage({Key? key}) : super(key: key);

  // var contentArr = [
  //   LocalizationLanguage.MY_ORDER_TEXT.tr,
  //   LocalizationLanguage.ORDER_HISTORY_TEXT.tr,
  //   LocalizationLanguage.EDIT_PROFILE_TEXT.tr,
  //   LocalizationLanguage.MYADDRESS_TEXT.tr
  // ];
  // var contentImageArr = [
  //   "profile_order_history",
  //   "profile_order_history",
  //   "profile_order_history",
  //   "profile_order_history"
  // ];
  @override
  Widget build(BuildContext context) {
    final CommonController _commonController = Get.put(CommonController());
    final CartController _cartController = Get.find<CartController>();
    return Scaffold(
      appBar: GlobalWidget.globalAppBar(
        LocalizationLanguage.MYACCOUNT_TEXT,
        Colors.transparent,
        true,
      ),
      body: Container(
        color: Color(0xfff2f2f2),
        child: Column(
          children: [
            //User Profile Info Container
            ProfileWidget(),
            SizedBox(
              height: Get.height * 0.1,
            ),
            //Logout button container
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Container(
                decoration: GlobalWidget.defaultContainerDecoration(),
                child: ListTile(
                  tileColor: Colors.amber,
                  selectedTileColor: Colors.cyan,
                  onTap: () {
                    print("Log In pressed");
                    _commonController.getUserSession() == false
                        ? Get.toNamed(AppRoutes.SIGNIN_PAGE)
                        : Get.defaultDialog(
                            title: "LogOut",
                            middleText:
                                "Are you sure you want to Delete your Account",
                            onConfirm: () {
                              _commonController.sharedPreferences.clear();
                              _commonController.storeSession(false);
                              _commonController.update();
                              _cartController.carts.clear();
                              Get.offAllNamed(AppRoutes.HOMEPAGE);
                            },
                            onCancel: () {
                              Navigator.of(context);
                            },
                          );
                  },
                  title: Row(
                    children: [
                      SvgPicture.asset('images/profile_order_history.svg'),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(_commonController.getUserSession() == false
                          ? LocalizationLanguage.LOGIN_TEXT.tr
                          : "LogOut"),
                    ],
                  ),
                  trailing: SvgPicture.asset('images/arrow_right.svg'),
                ),
              ),
            ),

            //language Change
            // Padding(
            //   padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
            //   child: Container(
            //     decoration: GlobalWidget.defaultContainerDecoration(),
            //     child: ListTile(
            //       tileColor: Colors.amber,
            //       selectedTileColor: Colors.cyan,
            //       title: Row(
            //         children: [
            //           Icon(
            //             Icons.language_rounded,
            //             size: 34.r,
            //           ),
            //           SizedBox(
            //             width: 10.w,
            //           ),
            //           Text(LocalizationLanguage.LANGUGAGE_TEXT.tr)
            //         ],
            //       ),
            //       trailing: Switch(
            //         value: _commonController.isSwitched,
            //         onChanged: (value) {
            //           _commonController.changeLocaleMethod(value);
            //         },
            //         activeTrackColor: Colors.grey,
            //         activeColor: kPrimaryColor,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
