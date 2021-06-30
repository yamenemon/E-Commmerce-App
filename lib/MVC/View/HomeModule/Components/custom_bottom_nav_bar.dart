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
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
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
                padding: EdgeInsets.only(top: 8.w),
                icon: Column(
                  children: [
                    SvgPicture.asset(
                      "images/Shop Icon.svg",
                      color: MenuState.home == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      child: Text(
                        "Home",
                        style: TextStyle(
                            color: MenuState.home == selectedMenu
                                ? kPrimaryColor
                                : inActiveIconColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                onPressed: () => Get.toNamed(AppRoutes.HOMEPAGE),
              ),
              IconButton(
                padding: EdgeInsets.only(top: 8.w),
                icon: Column(
                  children: [
                    SvgPicture.asset("images/Heart Icon.svg"),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      child: Text(
                        "Favourite",
                        style: TextStyle(
                            color: MenuState.favourite == selectedMenu
                                ? kPrimaryColor
                                : inActiveIconColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                onPressed: () {},
              ),
              IconButton(
                padding: EdgeInsets.only(top: 8.w),
                icon: Column(
                  children: [
                    SvgPicture.asset(
                      "images/Bill Icon.svg",
                      color: kSecondaryColor,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      child: Text(
                        "History",
                        style: TextStyle(
                            color: MenuState.message == selectedMenu
                                ? kPrimaryColor
                                : inActiveIconColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                onPressed: () {},
              ),
              IconButton(
                padding: EdgeInsets.only(top: 8.w),
                icon: Column(
                  children: [
                    SvgPicture.asset(
                      "images/User Icon.svg",
                      color: MenuState.profile == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      child: Text(
                        "Account",
                        style: TextStyle(
                            color: MenuState.message == selectedMenu
                                ? kPrimaryColor
                                : inActiveIconColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
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
