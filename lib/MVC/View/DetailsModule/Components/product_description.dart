import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/MVC/Controller/CommonController.dart';
import 'package:ecommerce_app/MVC/Model/ProductModule/ProductModel.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:ecommerce_app/GlobalWidget/globalWidget.dart';
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
  final CommonController _commonController = Get.find<CommonController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            flex: 6,
            child: Container(
              height: Get.height * 0.18.w,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20.w,
                        ),
                        child: Container(
                          width: 220.w,
                          child: Text(
                            product.nameEn.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                            maxLines: 2,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "\$${product.price}",
                            style: GoogleFonts.poppins(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: product.isDiscount! > 0
                                    ? Colors.grey
                                    : kPrimaryColor,
                                decoration: product.isDiscount! > 0
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none),
                          ),
                          product.isDiscount == 0
                              ? Text("")
                              : Text(
                                  " \$${_commonController.isSwitched == false ? _cartController.getCurrentProductDiscountPrice(product) : _commonController.convertNumber(_cartController.getCurrentProductDiscountPrice(product).toString())}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor),
                                ),
                        ],
                      )
                    ],
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                      ),
                      child: Container(
                        child: Text(
                          product.descriptionBn.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  GlobalWidget.buildPopupDialog(context,
                                      product.descriptionBn.toString()));
                        },
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
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  _cartController.toggleFavorite(product);
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
                        ),
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
        ],
      ),
    );
  }
}
