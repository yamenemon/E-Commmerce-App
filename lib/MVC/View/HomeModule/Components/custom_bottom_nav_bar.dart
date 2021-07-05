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
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h, left: 18.w, right: 18.w),
      child: Container(
        // margin: EdgeInsets.only(bottom: 25.h),
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.r,
              blurRadius: 0.5.r,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.r),
              topRight: Radius.circular(35.r),
              bottomLeft: Radius.circular(35.r),
              bottomRight: Radius.circular(35.r)),
        ),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildIconButton(MenuState.home),
              buildIconButton(MenuState.favourite),
              buildIconButton(MenuState.message),
              // buildIconButton(MenuState.profile),
            ],
          ),
        ),
      ),
    );
  }

  IconButton buildIconButton(MenuState tabState) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    Color textColor = inActiveIconColor;
    var tabName = "";
    var imageName = "";
    switch (tabState) {
      case MenuState.home:
        tabName = "Home";
        imageName = "images/Shop Icon.svg";
        textColor =
            selectedMenu == tabState ? kPrimaryColor : inActiveIconColor;
        break;
      case MenuState.favourite:
        imageName = "images/Heart Icon.svg";
        textColor =
            selectedMenu == tabState ? kPrimaryColor : inActiveIconColor;
        tabName = "Favourite";
        break;
      case MenuState.message:
        imageName = "images/Bill Icon.svg";
        textColor =
            selectedMenu == tabState ? kPrimaryColor : inActiveIconColor;
        tabName = "History";
        break;
      // case MenuState.profile:
      //   imageName = "images/User Icon.svg";
      //   textColor =
      //       selectedMenu == tabState ? kPrimaryColor : inActiveIconColor;
      //   tabName = "Profile";
      //   break;
      default:
    }

    return IconButton(
      padding: EdgeInsets.only(top: 5.w),
      icon: Column(
        children: [
          SvgPicture.asset(
            imageName,
            color: textColor,
          ),
          SizedBox(
            height: 4.h,
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            child: Text(
              tabName,
              style: TextStyle(
                  color: textColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
      onPressed: () {
        switch (tabState) {
          case MenuState.home:
            Get.toNamed(AppRoutes.HOMEPAGE);
            break;
          case MenuState.favourite:
            Get.toNamed(AppRoutes.FAVOURITE_PAGE);
            break;
          case MenuState.message:
            // Get.toNamed(AppRoutes.HOMEPAGE);
            break;
          // case MenuState.profile:
          //   Get.toNamed(AppRoutes.ACCOUNT_PAGE);
          //   break;
          default:
        }
      },
    );
  }
}
