import 'package:ecommerce_app/MVC/Controller/GetController.dart';
import 'package:ecommerce_app/Repository/MyRepository.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/AppUrl.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatelessWidget {
  GetController _getController =
      Get.put(GetController(repository: MyRepository()));
  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> categories = [
    //   {"icon": "images/Flash Icon.svg", "text": "Flash Deal"},
    //   {"icon": "images/Bill Icon.svg", "text": "Bill"},
    //   {"icon": "images/Game Icon.svg", "text": "Game"},
    //   {"icon": "images/Gift Icon.svg", "text": "Daily Gift"},
    //   {"icon": "images/Discover.svg", "text": "More"},
    // ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 420.w,
              height: 100.h,
              child: Obx(
                () => _getController.isLoading.value == true
                    ? Align(
                        alignment: Alignment.topCenter,
                        child: LinearProgressIndicator(
                          color: kWhiteColor,
                          backgroundColor: kWhiteColor,
                        ))
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _getController
                            .getModelList.value.categories!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: CategoryCard(
                              icon:
                                  "$BASE_URL/${_getController.getModelList.value.categories![index].appImage != null ? _getController.getModelList.value.categories![index].appImage! : " "}",
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
          ]

          //  List.generate(
          //   categories.length,
          //   (index) =>
          // ),
          ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: Get.height * 0.07,
        width: Get.height * 0.07,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              // height: Get.height * 0.07,
              // width: Get.height * 0.07,
              decoration: BoxDecoration(
                color: kPrimaryColor, //const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10.r),
              ),
              // child: Text(icon)
              //     Image.network(
              //   icon,
              //   //  fit: BoxFit.contain,
              //   filterQuality: FilterQuality.medium,
              // )
              // SvgPicture.asset(
              //   icon,
              //   color: Colors.white,
              // ),
            ),
            SizedBox(height: 5.h),
            Container(
              child: Text(text,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      fontSize: 10.sp, fontWeight: FontWeight.w500)),
            )
          ],
        ),
      ),
    );
  }
}
