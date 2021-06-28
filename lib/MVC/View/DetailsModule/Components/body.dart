import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/MVC/Model/DemoModel/ProductModel.dart';
import 'package:ecommerce_app/MVC/View/DetailsModule/Components/top_rounded_corner.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:ecommerce_app/Util/Language/LocalizationLanguage.dart';
import 'package:ecommerce_app/globalWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'product_description.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final ProductModel product;

  Body({Key? key, required this.product}) : super(key: key);
  final CartController _cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: kWhiteColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProductDescription(
                  product: product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: const Color(0xFFF6F7F9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 4.w),
                            height: 40.h,
                            width: 40.h,
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(16.r),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5.r,
                                    color: kGrayColor,
                                    offset: const Offset(0, 1))
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                if (_cartController.currentProductQty.value >
                                    0) {
                                  _cartController.currentProductQty--;

                                  _cartController
                                      .updateProductDetailsTotalPrice(product);
                                  _cartController.changeCart(
                                      product, CART_STATUS.DECREMENT);
                                }
                              },
                              child: Center(
                                child: GlobalWidget.text(
                                  "-",
                                  30.sp,
                                  FontWeight.w500,
                                  kBlackColor,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "${_cartController.getCurrentProductQty(product)}",
                            style: TextStyle(
                              fontFamily: 'CircularStd',
                              color: const Color(0xffa87016),
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 4.h),
                            height: 40.h,
                            width: 40.h,
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(16.r),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4.r,
                                    color: kGrayColor,
                                    offset: const Offset(0, 1))
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                _cartController.currentProductQty++;
                                _cartController
                                    .updateProductDetailsTotalPrice(product);
                                _cartController.changeCart(
                                    product, CART_STATUS.INCREMENT);
                              },
                              child: Center(
                                child: GlobalWidget.text(
                                  "+",
                                  30.sp,
                                  FontWeight.w500,
                                  kBlackColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TopRoundedContainer(
                        color: kWhiteColor,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Get.width * 0.15.w,
                              right: Get.width * 0.15.w,
                              top: 2.h,
                              bottom: 8.h),
                          child: GlobalWidget.defaultButton(
                              press: () {
                                final isExist = _cartController.carts
                                    .indexWhere((element) =>
                                        element.productDemoModel.id ==
                                        product.id);
                                if (isExist != -1) {
                                  Get.snackbar(
                                      LocalizationLanguage.CART_TEXT.tr,
                                      LocalizationLanguage.ITEM_ADDED_TEXT.tr,
                                      snackPosition: SnackPosition.BOTTOM,
                                      colorText: Colors.white,
                                      backgroundColor: Colors.brown[400]);
                                } else {
                                  _cartController.changeCart(
                                      product, CART_STATUS.INCREMENT);
                                }
                              },
                              text: "Add To Cart"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
