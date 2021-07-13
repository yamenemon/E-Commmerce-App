import 'package:ecommerce_app/MVC/Controller/ProductModule/GetController.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/AppUrl.dart';
import 'package:ecommerce_app/GlobalWidget/globalWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetController _getController = Get.find<GetController>();
    return Container(
      width: Get.width * 0.95,
      height: Get.height * 0.88,
      color: Colors.transparent,
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
                      arguments: [_getController.catDetailsProduct![index]],
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Container(
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
                      child: ListTile(
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              "$BASE_URL/${_getController.catDetailsProduct![index].picture.toString()}",
                              height: 80.h,
                              width: 80.h,
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.centerLeft,
                            )),
                        title: Text(
                          _getController.catDetailsProduct![index].nameEn
                              .toString(),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                              fontSize: 17.sp, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(
                              left: 0.0,
                              right: 5.0.w,
                              top: 5.0.h,
                              bottom: 5.0.h),
                          child: Text(
                            _getController
                                        .catDetailsProduct![index].descriptionBn
                                        .toString()
                                        .isEmpty ==
                                    true
                                ? "No description found"
                                : _getController
                                    .catDetailsProduct![index].descriptionBn
                                    .toString(),
                            maxLines: 3,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.sp),
                          ),
                        ),
                        trailing: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    GlobalWidget.buildPopupDialog(context,
                                        "${_getController.catDetailsProduct![index].descriptionBn.toString()}"),
                              );
                            },
                            child: Icon(Icons.more_vert)),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
