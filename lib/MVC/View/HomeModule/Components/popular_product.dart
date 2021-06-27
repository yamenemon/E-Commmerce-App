import 'package:ecommerce_app/MVC/Controller/GetController.dart';
import 'package:ecommerce_app/Repository/MyRepository.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetController _getController =
        Get.put(GetController(repository: MyRepository()));
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: 20.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ...List.generate(
              //  // demoProducts.length,
              //   (index) {
              //     if (demoProducts[index].isPopular)
              //       return ProductCard(product: demoProducts[index]);

              //     return SizedBox
              //         .shrink(); // here by default width and height is 0
              //   },
              // ),
              Container(
                width: Get.width,
                height: 200.h,
                child: Obx(
                  () => _getController.isLoading.value == true
                      ? Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.black,
                            color: Colors.white,
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _getController.getList?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(8.w),
                              child: Container(
                                height: 200.h,
                                width: Get.width * 0.5,
                                decoration: BoxDecoration(
                                  color: kSecondaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.r),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      _getController.getList?[index].image ??
                                          "0",
                                      height: 80.h,
                                      width: 80.w,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.w),
                                      child: Text(
                                        _getController.getList?[index].title ??
                                            "null",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),

              SizedBox(width: 20.w),
            ],
          ),
        )
      ],
    );
  }
}
