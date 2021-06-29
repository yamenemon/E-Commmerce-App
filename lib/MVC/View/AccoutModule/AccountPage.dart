import 'package:ecommerce_app/MVC/Controller/CommonController.dart';
import 'package:ecommerce_app/MVC/View/HomeModule/Components/custom_bottom_nav_bar.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:ecommerce_app/Util/Enums.dart';
import 'package:ecommerce_app/Util/Language/LocalizationLanguage.dart';
import 'package:ecommerce_app/globalWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  CommonController commonController = Get.put(CommonController());
  @override
  Widget build(BuildContext context) {
    var contentArr = [
      LocalizationLanguage.MY_ORDER_TEXT.tr,
      LocalizationLanguage.ORDER_HISTORY_TEXT.tr,
      LocalizationLanguage.EDIT_PROFILE_TEXT.tr,
      LocalizationLanguage.MYADDRESS_TEXT.tr
    ];
    var contentImageArr = [
      "profile_order_history",
      "profile_order_history",
      "profile_order_history",
      "profile_order_history"
    ];
    return Scaffold(
      appBar: GlobalWidget.globalAppBar(
        LocalizationLanguage.MYACCOUNT_TEXT.tr,
        Colors.transparent,
        true,
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
      body: Container(
        color: Color(0xfff2f2f2),
        child: Column(
          children: [
            //User Profile Info Container
            ProfileWidget(),

            //Order Info Container
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Container(
                  decoration: GlobalWidget.defaultContainerDecoration(),
                  child: getTextWidgets(contentArr, contentImageArr)),
            ),

            //Logout button container
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Container(
                decoration: GlobalWidget.defaultContainerDecoration(),
                child: ListTile(
                  tileColor: Colors.amber,
                  selectedTileColor: Colors.cyan,
                  onTap: () {
                    print("Log In pressed");
                    Get.toNamed(AppRoutes.SIGNIN_PAGE);
                  },
                  title: Row(
                    children: [
                      SvgPicture.asset('images/profile_order_history.svg'),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(LocalizationLanguage.LOGIN_TEXT.tr)
                    ],
                  ),
                  trailing: SvgPicture.asset('images/arrow_right.svg'),
                ),
              ),
            ),

            //language Change
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: Container(
                decoration: GlobalWidget.defaultContainerDecoration(),
                child: ListTile(
                  tileColor: Colors.amber,
                  selectedTileColor: Colors.cyan,
                  onTap: () {
                    print("Log In pressed");
                    // Get.toNamed(AppRoutes.SIGNIN_PAGE);
                  },
                  title: Row(
                    children: [
                      Icon(
                        Icons.language_rounded,
                        size: 34.r,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(LocalizationLanguage.LANGUGAGE_TEXT.tr)
                    ],
                  ),
                  trailing: Switch(
                    value: commonController.isSwitched,
                    onChanged: (value) {
                      commonController.changeLocaleMethod(value);
                    },
                    activeTrackColor: Colors.grey,
                    activeColor: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTextWidgets(List<String> arr, List<String> imageArr) {
    List<Widget> list = [];
    for (var i = 0; i < arr.length; i++) {
      list.add(ListTile(
        onTap: () {
          switch (PAGES.values[i]) {
            case PAGES.MY_ORDER:
              // Get.toNamed(AppRoutes.MY_ORDER_PAGE);
              break;
            case PAGES.ORDER_HISTORY:
              // Get.toNamed(AppRoutes.ORDER_HISTORY_PAGE);
              break;
            case PAGES.EDIT_PROFILE:
              // Get.toNamed(AppRoutes.EDIT_PROFILE_PAGE);
              break;
            case PAGES.MY_ADDRESS:
              // Get.toNamed(AppRoutes.ADDRESS_PAGE);
              break;
            default:
              return null;
          }
        },
        title: Row(
          children: [
            SvgPicture.asset('images/${imageArr[i]}.svg'),
            SizedBox(
              width: 10.w,
            ),
            Text(arr[i])
          ],
        ),
        trailing: SvgPicture.asset('images/arrow_right.svg'),
      ));
    }
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: list);
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.h, bottom: 0.h, left: 20.w, right: 20.w),
      height: Get.height * 0.14,
      color: Colors.transparent,
      child: Row(
        children: [
          ClipOval(
            child: Material(
              color: Colors.transparent, // Button color
              child: InkWell(
                splashColor: Colors.red, // Splash color
                onTap: () {
                  print("PRESSING ICON");
                },
                child: SizedBox(
                  width: 100.w,
                  height: 100.w,
                  child: SvgPicture.asset(
                    "images/profile_icon.svg",
                  ),
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
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  "Sultana Anjum",
                  style: TextStyle(
                    fontFamily: circularStdBold,
                    color: Color(0xff3f1f20),
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  "01677515692",
                  style: TextStyle(
                    fontFamily: circularStdBold,
                    color: Color(0xff808080),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  "Niketon,Gulshan 01",
                  style: TextStyle(
                    fontFamily: circularStdBold,
                    color: Color(0xff808080),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
