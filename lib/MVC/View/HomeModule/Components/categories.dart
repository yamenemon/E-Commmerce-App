import 'package:ecommerce_app/MVC/Controller/GetController.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/AppUrl.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:ecommerce_app/Util/TransparenImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatelessWidget {
  GetController _getController = Get.find<GetController>();
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
          ]),
    );
  }
}

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    bool _validURL = Uri.parse(icon).isAbsolute;
    if (icon.contains(".jpg") ||
        // icon.contains(".gif") ||
        icon.contains(".png") ||
        icon.contains(".jpeg")) {
      print(icon);
    } else {
      icon =
          "http://ecommerce.tritechfirm.com/app-api/images/categories/1618600452.jpg";
    }
    print(icon);
    print(_validURL);

    return GestureDetector(
      onTap: press,
      child: Container(
        width: Get.width * 0.2,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              margin: EdgeInsets.all(1),
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
                    offset: const Offset(-1, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: icon,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            Container(
              child: Text(text,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      fontSize: 12.sp, fontWeight: FontWeight.w500)),
            )
          ],
        ),
      ),
    );
  }
}
