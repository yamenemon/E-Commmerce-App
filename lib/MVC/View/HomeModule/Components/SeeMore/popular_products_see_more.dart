import 'package:ecommerce_app/MVC/Controller/GetController.dart';
import 'package:ecommerce_app/MVC/Model/DemoModel/ProductModel.dart';
import 'package:ecommerce_app/Repository/MyRepository.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/AppUrl.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularProductsSeeMore extends StatelessWidget {
  const PopularProductsSeeMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetController _getController =
        Get.put(GetController(repository: MyRepository()));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Products"),
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width * 0.9,
                    height: Get.height * 0.88,
                    child: Obx(
                      () => _getController.isLoading.value == true
                          ? Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.black,
                                color: kPrimaryColor,
                              ),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: _getController
                                  .getModelList.value.products!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                      AppRoutes.PRODUCT_DETAIL_PAGE,
                                      arguments: [
                                        Product(
                                          productId: _getController.getModelList
                                              .value.products![index].productId,
                                          amount: _getController.getModelList
                                              .value.products![index].amount,
                                          categoryId: _getController
                                              .getModelList
                                              .value
                                              .products![index]
                                              .categoryId,
                                          descriptionBn: _getController
                                              .getModelList
                                              .value
                                              .products![index]
                                              .descriptionBn,
                                          descriptionEn: _getController
                                              .getModelList
                                              .value
                                              .products![index]
                                              .descriptionEn,
                                          image2: _getController.getModelList
                                              .value.products![index].image2,
                                          image3: _getController.getModelList
                                              .value.products![index].image3,
                                          index: _getController.getModelList
                                              .value.products![index].index,
                                          isDiscount: _getController
                                              .getModelList
                                              .value
                                              .products![index]
                                              .isDiscount,
                                          isPercentage: _getController
                                              .getModelList
                                              .value
                                              .products![index]
                                              .isPercentage,
                                          nameBn: _getController.getModelList
                                              .value.products![index].nameBn,
                                          nameEn: _getController.getModelList
                                              .value.products![index].nameEn,
                                          picture:
                                              "$BASE_URL/${_getController.getModelList.value.products![index].picture}",
                                          price: _getController.getModelList
                                              .value.products![index].price,
                                          salePrice: _getController.getModelList
                                              .value.products![index].salePrice,
                                          unit: _getController.getModelList
                                              .value.products![index].unit,
                                          stock: _getController.getModelList
                                              .value.products![index].stock,
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
                                            color:
                                                Colors.grey.withOpacity(0.15),
                                            spreadRadius: 2,
                                            blurRadius: 1,
                                            offset: const Offset(0,
                                                0), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Hero(
                                            tag: _getController
                                                .getModelList
                                                .value
                                                .products![index]
                                                .productId
                                                .toString(),
                                            //  _getController.getModelList.value
                                            //     .products!![index].productId
                                            //     .toString(),
                                            child: Image.network(
                                              "$BASE_URL/${_getController.getModelList.value.products![index].picture}",
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
