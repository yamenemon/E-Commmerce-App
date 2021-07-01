import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/MVC/Model/DemoModel/ProductModel.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDescription extends StatelessWidget {
  ProductDescription({
    Key? key,
    required this.product,
    required this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback pressOnSeeMore;

  final CartController _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            product.nameEn.toString(),
            maxLines: 2,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              _cartController.toggleFavorite(product.productId);
            },
            child: GetBuilder<CartController>(
              builder: (contrller) {
                return Container(
                  padding: EdgeInsets.all(15.w),
                  width: 64.w,
                  decoration: BoxDecoration(
                    color: _cartController.favouriteList
                            .contains(product.productId)
                        ? const Color(0xFFFFE6E6)
                        : const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      bottomLeft: Radius.circular(20.r),
                    ),
                  ),
                  child: SvgPicture.asset(
                    "images/Heart Icon_2.svg",
                    color: _cartController.favouriteList
                            .contains(product.productId)
                        ? const Color(0xFFFF4848)
                        : const Color(0xFFDBDEE4),
                    height: 16.h,
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
          ),
          child: Container(
            child: Text(
              product.descriptionEn.toString(),
              style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              maxLines: 2,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  "See More Detail",
                  style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                      color: kPrimaryColor),
                ),
                SizedBox(width: 5.w),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12.sp,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
