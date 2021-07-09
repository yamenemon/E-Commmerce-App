import 'package:ecommerce_app/MVC/Controller/GetController.dart';
import 'package:ecommerce_app/Repository/MyRepository.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/AppUrl.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:ecommerce_app/globalWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularProductsSeeMore extends StatelessWidget {
  const PopularProductsSeeMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arg = Get.arguments;
    final GetController _getController = Get.find<GetController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          GlobalWidget.globalAppBar("All Products", Colors.transparent, true),
      body: Column(
        children: [
          arg == "search"
              ? Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      onChanged: (value) => _getController.searchMethod(value),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 9.h),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "Search product",
                          prefixIcon: Icon(Icons.search)),
                    ),
                  ),
                )
              : Text(""),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Get.width * 0.9,
                  height: Get.height * 0.78,
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
                            itemCount: _getController.searchList!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.toNamed(
                                    AppRoutes.PRODUCT_DETAIL_PAGE,
                                    arguments: [
                                      _getController.searchList![index]
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
                                          offset: const Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: ListTile(
                                      leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            "$BASE_URL/${_getController.searchList![index].picture}",
                                            height: 80.h,
                                            width: 80.h,
                                            fit: BoxFit.fitWidth,
                                            alignment: Alignment.centerLeft,
                                          )),
                                      title: Text(
                                        _getController.searchList![index].nameEn
                                            .toString(),
                                        maxLines: 1,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Padding(
                                        padding: EdgeInsets.only(
                                            left: 0.0,
                                            right: 5.0.w,
                                            top: 5.0.h,
                                            bottom: 5.0.h),
                                        child: Text(
                                          _getController.searchList![index]
                                                      .descriptionBn
                                                      .toString()
                                                      .isEmpty ==
                                                  true
                                              ? "No description found"
                                              : _getController
                                                  .searchList![index]
                                                  .descriptionBn
                                                  .toString(),
                                          maxLines: 3,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp),
                                        ),
                                      ),
                                      trailing: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                GlobalWidget.buildPopupDialog(
                                                    context,
                                                    "${_getController.searchList![index].descriptionBn.toString()}"),
                                          );
                                        },
                                        child: Icon(Icons.more_vert),
                                      ),
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
    );
  }
}
