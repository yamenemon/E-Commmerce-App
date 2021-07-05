import 'package:ecommerce_app/MVC/Controller/GetController.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/AppUrl.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
                width: Get.width - 20.w,
                height: Get.height * 0.28,
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
                          itemCount: _getController.listToShow.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(
                                  AppRoutes.PRODUCT_DETAIL_PAGE,
                                  arguments: [_getController.listToShow[index]],
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.all(8.w),
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
                                        offset: const Offset(-1,
                                            1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Hero(
                                          tag: _getController
                                              .listToShow[index].productId
                                              .toString(),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              "$BASE_URL/${_getController.listToShow[index].picture}",
                                              height: 110.h,
                                              width: 110.h,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.h,
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
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                        Container(
                                            child: _getController
                                                        .listToShow[index]
                                                        .isDiscount! >
                                                    0
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        text: '',
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text:
                                                                "\$${_getController.listToShow[index].price!}",
                                                            style: TextStyle(
                                                              color:
                                                                  kPrimaryColor,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        text: '',
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text:
                                                                "\$${_getController.listToShow[index].price!}",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                            ),
                                                          ),
                                                          TextSpan(text: " "),
                                                          TextSpan(
                                                            text:
                                                                "\$${_getController.listToShow[index].price! - ((_getController.listToShow[index].isDiscount! * _getController.listToShow[index].price!) / 100)}",
                                                            style: TextStyle(
                                                              color:
                                                                  kPrimaryColor,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
              SizedBox(width: 10.h),
            ],
          ),
        )
      ],
    );
  }
}
