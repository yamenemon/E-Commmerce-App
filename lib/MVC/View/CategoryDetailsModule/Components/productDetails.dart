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
  var pId;
  ProductsDetails({this.pId});

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
              child: Obx(
                () => _getController.isLoading.value == true
                    ? const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.black,
                          color: kPrimaryColor,
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount:
                            _getController.getModelList.value.products!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // Get.toNamed(
                              //   AppRoutes.PRODUCT_DETAIL_PAGE,
                              // arguments: [
                              //   Product(
                              //     productId: _getController
                              //         .categorProduct[index].productId,
                              //     amount: _getController
                              //         .categorProduct[index].amount,
                              //     categoryId: _getController
                              //         .categorProduct[index].categoryId,
                              //     descriptionBn: _getController
                              //         .categorProduct[index].descriptionBn,
                              //     descriptionEn: _getController
                              //         .categorProduct[index].descriptionEn,
                              //     image2: _getController
                              //         .categorProduct[index].image2,
                              //     image3: _getController
                              //         .categorProduct[index].image3,
                              //     index: _getController
                              //         .categorProduct[index].index,
                              //     isDiscount: _getController
                              //         .categorProduct[index].isDiscount,
                              //     isPercentage: _getController
                              //         .categorProduct[index].isPercentage,
                              //     nameBn: _getController
                              //         .categorProduct[index].nameBn,
                              //     nameEn: _getController
                              //         .categorProduct[index].nameEn,
                              //     picture:
                              //         "$BASE_URL/${_getController.categorProduct[index].picture}",
                              //     price: _getController
                              //         .categorProduct[index].price,
                              //     salePrice: _getController
                              //         .categorProduct[index].salePrice,
                              //     unit: _getController
                              //         .categorProduct[index].unit,
                              //     stock: _getController
                              //         .categorProduct[index].stock,
                              //   )
                              // ],
                              // );
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
                                      "$BASE_URL/${_getController.getModelList.value.products![index].picture}",
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
                                        _getController.getModelList.value
                                            .products![index].nameEn
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
        )
      ],
    );
  }
}
