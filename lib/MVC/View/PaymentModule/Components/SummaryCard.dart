import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/MVC/Controller/CommonController.dart';
import 'package:ecommerce_app/MVC/Model/CartModule/cartModel.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryCard extends StatelessWidget {
  SummaryCard({Key? key, required this.cart}) : super(key: key);
  late Cart cart;
  CommonController _commonController = Get.find<CommonController>();
  CartController _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Card(
        child: Row(
          children: [
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
                  width: Get.width * 0.8,
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
                                  style: Theme.of(context).textTheme.bodyText2),
                            ],
                          ),
                        ),
                      ),
                      Text(
                          " = ${_commonController.isSwitched == false ? _cartController.getCurrentProductTotalPrice(cart.productDemoModel) : _commonController.convertNumber(_cartController.getCurrentProductTotalPrice(cart.productDemoModel).toString())}")
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
