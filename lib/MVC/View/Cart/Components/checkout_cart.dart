import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/MVC/Controller/CommonController.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:ecommerce_app/globalWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutCard extends StatelessWidget {
  CheckoutCard({
    Key? key,
  }) : super(key: key);

  final CartController _cartController = Get.find<CartController>();
  final CommonController _commonController = Get.find<CommonController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
        horizontal: 30.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: SvgPicture.asset("images/receipt.svg"),
                ),
                const Spacer(),
                Text(
                  "Add voucher code",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12.sp,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text.rich(
                    TextSpan(
                      text: "Total:\n",
                      children: [
                        TextSpan(
                          text:
                              "\$${_cartController.cartPageTotalPrice.toInt().toString().length > 6 ? "${_cartController.cartPageTotalPrice.toString().substring(0, 6)}.." : "${_commonController.isSwitched == false ? _cartController.cartPageTotalPrice.toStringAsFixed(2) : _commonController.convertNumber(_cartController.cartPageTotalPrice.toStringAsFixed(2).toString())}"}",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 190.w,
                  child: GlobalWidget.defaultButton(
                    press: () {
                      Get.toNamed(AppRoutes.SIGNIN_PAGE);
                    },
                    text: "Check Out",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
