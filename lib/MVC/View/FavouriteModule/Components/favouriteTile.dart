import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/MVC/Model/ProductModule/ProductModel.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/AppUrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteTile extends StatelessWidget {
  final Product product;
  FavouriteTile({required this.product});
  final CartController _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoutes.PRODUCT_DETAIL_PAGE,
          arguments: [product],
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: 12.h, left: 12.w, right: 12.w),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(16.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 1,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  "$BASE_URL/${product.picture}",
                  height: 80.h,
                  width: 80.h,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.centerLeft,
                )),
            title: Text(
              product.nameEn.toString(),
              maxLines: 1,
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                  fontSize: 17.sp, fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(
                  left: 0.0, right: 5.0.w, top: 5.0.h, bottom: 5.0.h),
              child: Text(
                product.descriptionBn.toString().isEmpty == true
                    ? "No description found"
                    : product.descriptionBn.toString(),
                maxLines: 3,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black, fontSize: 12.sp),
              ),
            ),
            trailing: GestureDetector(
              onTap: () {
                _cartController.favouriteList.remove(product);
                _cartController.update();
              },
              child: GetBuilder<CartController>(
                builder: (contrller) {
                  return Container(
                    padding: EdgeInsets.all(15.w),
                    width: 64.w,
                    decoration: BoxDecoration(
                      color: _cartController.favouriteList.contains(product)
                          ? const Color(0xFFFFE6E6)
                          : const Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          bottomLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r)),
                    ),
                    child: SvgPicture.asset(
                      "images/Heart Icon_2.svg",
                      color: _cartController.favouriteList.contains(product)
                          ? const Color(0xFFFF4848)
                          : const Color(0xFFDBDEE4),
                      height: 16.h,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
