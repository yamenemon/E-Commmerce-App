import 'package:ecommerce_app/MVC/Model/NotificationModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel notificationModel;
  NotificationTile({required this.notificationModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.toNamed(
        //   // AppRoutes.PRODUCT_DETAIL_PAGE,
        //   // arguments: [_getController.catDetailsProduct![index]],
        // );
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
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
            title: Text(
              notificationModel.title.toString(),
              maxLines: 1,
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                  fontSize: 17.sp, fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(
                  left: 0.0, right: 5.0.w, top: 5.0.h, bottom: 5.0.h),
              child: Text(
                notificationModel.description.toString().isEmpty == true
                    ? "No description found"
                    : notificationModel.description.toString(),
                maxLines: 3,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black, fontSize: 12.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
