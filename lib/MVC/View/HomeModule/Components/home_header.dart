import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/MVC/Controller/CommonController.dart';
import 'package:ecommerce_app/MVC/View/HomeModule/Components/icon_btn_counter.dart';
import 'package:ecommerce_app/MVC/View/HomeModule/Components/searchField.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/globalWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({
    Key? key,
  }) : super(key: key);
  final CommonController _commonController = Get.find<CommonController>();
  final CartController _cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          InkWell(
            onTap: () {
              if (_cartController.carts.isEmpty) {
                //Get.toNamed(AppRoutes.EMPTY_CART_PAGE);
              } else {
                Get.toNamed(AppRoutes.CART_PAGE);
              }
            },
            child: Obx(
              () => GlobalWidget.cartIcon(
                _commonController.isSwitched == false
                    ? _cartController.carts.length.toString()
                    : _commonController
                        .convertNumber(_cartController.carts.length.toString()),
              ),
            ),
          ),
          IconBtnWithCounter(
            svgSrc: "images/Bell.svg",
            quantity: 0,
            press: () {
              print(_commonController.getUserSession());
              Get.toNamed(AppRoutes.NOTIFICATION_PAGE);
            },
          ),
        ],
      ),
    );
  }
}
