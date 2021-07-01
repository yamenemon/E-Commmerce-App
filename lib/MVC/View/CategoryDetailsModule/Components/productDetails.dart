import 'dart:io';

import 'package:ecommerce_app/MVC/Controller/GetController.dart';
import 'package:ecommerce_app/MVC/Model/DemoModel/ProductModel.dart';
import 'package:ecommerce_app/Repository/MyRepository.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/AppUrl.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetController _getController =
        Get.put(GetController(repository: MyRepository()));
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Get.width * 0.8,
              height: Get.height * 0.88,
              child: _getController.catDetailsProduct!.length == 0
                  ? Center(
                      child: Text(
                        "Product Will be Added Very Soon",
                        style: TextStyle(color: Colors.black, fontSize: 16.sp),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _getController.catDetailsProduct!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.PRODUCT_DETAIL_PAGE,
                              arguments: [
                                Product(
                                  productId: _getController
                                      .catDetailsProduct![index].productId,
                                  amount: _getController
                                      .catDetailsProduct![index].amount,
                                  categoryId: _getController
                                      .catDetailsProduct![index].categoryId,
                                  descriptionBn: _getController
                                      .catDetailsProduct![index].descriptionBn,
                                  descriptionEn: _getController
                                      .catDetailsProduct![index].descriptionEn,
                                  image2: _getController
                                      .catDetailsProduct![index].image2,
                                  image3: _getController
                                      .catDetailsProduct![index].image3,
                                  index: _getController
                                      .catDetailsProduct![index].index,
                                  isDiscount: _getController
                                      .catDetailsProduct![index].isDiscount,
                                  isPercentage: _getController
                                      .catDetailsProduct![index].isPercentage,
                                  nameBn: _getController
                                      .catDetailsProduct![index].nameBn,
                                  nameEn: _getController
                                      .catDetailsProduct![index].nameEn,
                                  picture:
                                      "$BASE_URL/${_getController.catDetailsProduct![index].picture}",
                                  price: _getController
                                      .catDetailsProduct![index].price,
                                  salePrice: _getController
                                      .catDetailsProduct![index].salePrice,
                                  unit: _getController
                                      .catDetailsProduct![index].unit,
                                  stock: _getController
                                      .catDetailsProduct![index].stock,
                                )
                              ],
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10.w),
                            child: Container(
                              width: Get.width * 0.3,
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
                                    offset: const Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.network(
                                    "$BASE_URL/${_getController.catDetailsProduct![index].picture}",
                                    height: 100.h,
                                    width: 100.w,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    child: Text(
                                      _getController
                                          .catDetailsProduct![index].nameEn
                                          .toString(),
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12.sp),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            SizedBox(width: 10.w),
          ],
        )
      ],
    );
  }
}
