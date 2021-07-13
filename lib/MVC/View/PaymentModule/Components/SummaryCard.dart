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
  final CommonController _commonController = Get.find<CommonController>();
  final CartController _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Card(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ignore: sized_box_for_whitespace
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                child: Text(
                  cart.productDemoModel.nameEn.toString(),
                  style: GoogleFonts.poppins(
                      fontSize: 15.sp, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ),
            // SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Text.rich(
                        TextSpan(
                          text:
                              "\$${_commonController.isSwitched == false ? _cartController.getCurrentProductDiscountPrice(cart.productDemoModel) : _commonController.convertNumber(_cartController.getCurrentProductDiscountPrice(cart.productDemoModel).toString())}",
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
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Text(
                        " = ${_commonController.isSwitched == false ? _cartController.getCurrentProductTotalPrice(cart.productDemoModel).toStringAsFixed(2) : _commonController.convertNumber(_cartController.getCurrentProductTotalPrice(cart.productDemoModel).toStringAsFixed(2).toString())}",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
