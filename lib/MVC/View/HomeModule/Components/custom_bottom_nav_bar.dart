import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:ecommerce_app/Util/Enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h, left: 18.w, right: 18.w),
      child: Container(
        // margin: EdgeInsets.only(bottom: 25.h),
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.r,
              blurRadius: 0.5.r,
              offset: const Offset(0, 0), // changes position of shadow
            ),
            // BoxShadow(
            //   offset: Offset(0, -15),
            //   blurRadius: 20.r,
            //   color: Color(0xFFDADADA).withOpacity(1),
            // ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r),
              topRight: Radius.circular(40.r),
              bottomLeft: Radius.circular(40.r),
              bottomRight: Radius.circular(40.r)),
        ),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "images/Shop Icon.svg",
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () => Get.toNamed(AppRoutes.HOMEPAGE),
              ),
              IconButton(
                icon: SvgPicture.asset("images/Heart Icon.svg"),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "images/Bill Icon.svg",
                  color: kSecondaryColor,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "images/User Icon.svg",
                  color: MenuState.profile == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () => Get.toNamed(AppRoutes.ACCOUNT_PAGE),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
