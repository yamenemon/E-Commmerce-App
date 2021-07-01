import 'package:ecommerce_app/MVC/Controller/GetController.dart';
import 'package:ecommerce_app/MVC/Model/DemoModel/ProductModel.dart';
import 'package:ecommerce_app/Repository/MyRepository.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/AppUrl.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetController _getController = Get.find<GetController>();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SectionTitle(
              title: "Popular Products",
              press: () {
                Get.toNamed(AppRoutes.POPULAR_SEE_MORE_PAGE);
              }),
        ),
        SizedBox(height: 5.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: Get.width,
                height: Get.height * 0.2,
                child: Obx(
                  () => _getController.isLoading.value == true
                      ? const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.black,
                            color: kPrimaryColor,
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          //  _getController
                          //     .getModelList.value.products!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(
                                  AppRoutes.PRODUCT_DETAIL_PAGE,
                                  arguments: [
                                    Product(
                                      productId: _getController
                                          .listToShow[index].productId,
                                      amount: _getController
                                          .listToShow[index].amount,
                                      categoryId: _getController
                                          .listToShow[index].categoryId,
                                      descriptionBn: _getController
                                          .listToShow[index].descriptionBn,
                                      descriptionEn: _getController
                                          .listToShow[index].descriptionEn,
                                      image2: _getController
                                          .listToShow[index].image2,
                                      image3: _getController
                                          .listToShow[index].image3,
                                      index: _getController
                                          .listToShow[index].index,
                                      isDiscount: _getController
                                          .listToShow[index].isDiscount,
                                      isPercentage: _getController
                                          .listToShow[index].isPercentage,
                                      nameBn: _getController
                                          .listToShow[index].nameBn,
                                      nameEn: _getController
                                          .listToShow[index].nameEn,
                                      picture:
                                          "$BASE_URL/${_getController.listToShow[index].picture}",
                                      price: _getController
                                          .listToShow[index].price,
                                      salePrice: _getController
                                          .listToShow[index].salePrice,
                                      unit:
                                          _getController.listToShow[index].unit,
                                      stock: _getController
                                          .listToShow[index].stock,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Hero(
                                        tag: _getController
                                            .listToShow[index].productId
                                            .toString(),
                                        //  _getController.getModelList.value
                                        //     .products![index].productId
                                        //     .toString(),
                                        child: Image.network(
                                          "$BASE_URL/${_getController.listToShow[index].picture}",
                                          height: 100.h,
                                          width: 100.w,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        child: Text(
                                          _getController
                                              .listToShow[index].nameEn
                                              .toString(),
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp),
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
              ),
              SizedBox(width: 10.w),
            ],
          ),
        )
      ],
    );
  }
}
