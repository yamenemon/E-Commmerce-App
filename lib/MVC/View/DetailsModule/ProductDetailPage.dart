import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/MVC/Controller/CommonController.dart';
import 'package:ecommerce_app/MVC/Model/DemoModel/ProductModel.dart';
import 'package:ecommerce_app/MVC/View/DetailsModule/Components/body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/globalWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatelessWidget {
  Product _model = Get.arguments[0]!;
  final CartController _cartController = Get.find<CartController>();
  final CommonController _commonController = Get.find<CommonController>();

  @override
  Widget build(BuildContext context) {
    return _cartController.obx(
      (state) => Scaffold(
        backgroundColor: const Color(0xFFF5F6F9),
        appBar: GlobalWidget.globalAppBar(
          "",
          Colors.transparent,
          true,
          actionWidgets: [
            Padding(
              padding: EdgeInsets.only(right: 16.w, top: 20.h),
              child: InkWell(
                onTap: () {
                  if (_cartController.carts.isEmpty) {
                    // Get.toNamed(AppRoutes.EMPTY_CART_PAGE);
                  } else {
                    Get.toNamed(AppRoutes.CART_PAGE);
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(right: 24.w),
                  child: Obx(
                    () => GlobalWidget.cartIcon(
                      _commonController.isSwitched == false
                          ? _cartController.carts.length.toString()
                          : _commonController.convertNumber(
                              _cartController.carts.length.toString()),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Body(
          product: _model,
        ),
      ),
    );
  }
}
