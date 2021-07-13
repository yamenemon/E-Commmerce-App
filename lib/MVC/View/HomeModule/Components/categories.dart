import 'package:ecommerce_app/MVC/Controller/ProductModule/GetController.dart';
import 'package:ecommerce_app/MVC/View/HomeModule/Components/category_card.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/AppUrl.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  final GetController _getController = Get.find<GetController>();
  var tempUri = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.20,
            child: Obx(
              () => _getController.isLoading.value == true
                  ? Align(
                      alignment: Alignment.topCenter,
                      child: LinearProgressIndicator(
                        color: kWhiteColor,
                        backgroundColor: kWhiteColor,
                      ))
                  : _getController.getModelList.value.categories == null
                      ? Text("")
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _getController
                              .getModelList.value.categories!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: CategoryCard(
                                icon:
                                    "$BASE_URL/${_getController.getModelList.value.categories![index].appImage != null ? _getController.getModelList.value.categories![index].appImage : " "}",
                                text: _getController.getModelList.value
                                    .categories![index].nameEn!,
                                press: () {
                                  var _pId = _getController
                                      .getModelList.value.categories![index].id;
                                  _getController.productStore(
                                      _getController.data!, _pId);
                                  Get.toNamed(AppRoutes.CATEGORY_DETAILS_PAGE);
                                },
                              ),
                            );
                          },
                        ),
            ),
          )
        ],
      ),
    );
  }
}
