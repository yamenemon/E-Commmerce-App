import 'package:ecommerce_app/MVC/Controller/CommonController.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:ecommerce_app/Util/Language/LocalizationLanguage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final CommonController _commonController = Get.find<CommonController>();
    return Container(
      margin: EdgeInsets.only(top: 5.h, bottom: 0.h, left: 20.w, right: 20.w),
      height: Get.height * 0.16,
      color: Colors.transparent,
      child: Row(
        children: [
          ClipOval(
            child: Material(
              color: Colors.transparent, // Button color
              child: SizedBox(
                width: 100.w,
                height: 100.w,
                child: SvgPicture.asset(
                  "images/profile_icon.svg",
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    _commonController.storedata == false
                        ? LocalizationLanguage.ACCOUNTGUEST_TEXT.tr
                        : _commonController.getUserName(),
                    style: TextStyle(
                      fontFamily: circularStdBold,
                      color: Color(0xff3f1f20),
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    _commonController.storedata == false
                        ? LocalizationLanguage.ACCOUNTNUMBER_TEXT.tr
                        : _commonController.getUserMobile(),
                    style: TextStyle(
                      fontFamily: circularStdBold,
                      color: Color(0xff808080),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    _commonController.storedata == false
                        ? LocalizationLanguage.ACCOUNTADDRESS_TEXT.tr
                        : _commonController.getUserAddress(),
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: circularStdBold,
                      color: Color(0xff808080),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
