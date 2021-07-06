import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.POPULAR_SEE_MORE_PAGE, arguments: "search");
      },
      child: Container(
        width: Get.width * 0.6,
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 9.h),
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.blue,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text("Search product"),
            ],
          ),
        ),
      ),
    );
  }
}
