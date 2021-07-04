import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/MVC/Controller/CommonController.dart';
import 'package:ecommerce_app/MVC/Model/CartModule/cartModel.dart';
import 'package:ecommerce_app/Util/AppUrl.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartCard extends StatelessWidget {
  CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  late Cart cart;
  CommonController _commonController = Get.find<CommonController>();
  CartController _cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88.w,
          child: AspectRatio(
            aspectRatio: 0.88.sp,
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Image.network(
                  "$BASE_URL/${cart.productDemoModel.picture.toString()}"),
            ),
          ),
        ),
        SizedBox(width: 20.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              width: Get.width * 0.5,
              child: Text(
                cart.productDemoModel.nameEn.toString(),
                style: GoogleFonts.poppins(
                    fontSize: 15.sp, fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: Get.width * 0.7.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text.rich(
                      TextSpan(
                        text: "\$${cart.productDemoModel.price}",
                        style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor),
                        children: [
                          TextSpan(
                              text:
                                  " x ${_commonController.isSwitched == false ? _cartController.getCurrentProductQty(cart.productDemoModel) : _commonController.convertNumber(_cartController.getCurrentProductQty(cart.productDemoModel).toString())}",
                              //" x ${cart.quantity}",
                              style: Theme.of(context).textTheme.bodyText2),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 130.w,
                    height: 36.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            _cartController.changeCart(
                                cart.productDemoModel, CART_STATUS.DECREMENT);
                          },
                          child: Center(
                            child: Text(
                              "-",
                              style: TextStyle(
                                fontFamily: 'CircularStd',
                                color: Color(0xff000000),
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => Text(
                              "${_commonController.isSwitched == false ? _cartController.getCurrentProductQty(cart.productDemoModel) : _commonController.convertNumber(_cartController.getCurrentProductQty(cart.productDemoModel).toString())}",
                              style: TextStyle(
                                fontFamily: 'CircularStd',
                                color: Color(0xffa87016),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            _cartController.changeCart(
                                cart.productDemoModel, CART_STATUS.INCREMENT);
                          },
                          child: Center(
                            child: Text(
                              "+",
                              style: TextStyle(
                                fontFamily: 'CircularStd',
                                color: Color(0xff000000),
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: new BoxDecoration(
                      color: Color(0xfff2f2f2),
                      borderRadius: BorderRadius.circular(6.w),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
