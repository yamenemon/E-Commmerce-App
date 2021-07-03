// ignore: file_names
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalWidget {
  static circularContainer(EdgeInsetsGeometry padding, Color backgroundColor,
      double radius, Widget child) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }

  static circularContainerWithHeight(EdgeInsetsGeometry padding, double height,
      Color backgroundColor, double radius, Widget child) {
    return Container(
      padding: padding,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }

  static circularContainerWithBorder(
      EdgeInsetsGeometry padding,
      Color backgroundColor,
      double radius,
      Color borderColor,
      double borderWidth,
      Widget child) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }

  static text(String str, double fontSize, FontWeight fontWeight, Color color) {
    return Text(
      str,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: 0,
      ),
    );
  }

  static globalAppBar(String title, Color? bgColor, bool isBackBtn,
      {List<Widget>? actionWidgets}) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: bgColor,
      leadingWidth: 0,
      titleSpacing: 5,
      title: Row(
        children: [
          isBackBtn == true
              ? CircleAvatar(
                  // radius: 24,
                  backgroundColor: kWhiteColor,
                  child: Center(
                    child: IconButton(
                      color: Colors.grey,
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: kGrayColor,
                        size: 24.sp,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(title.tr,
                style: TextStyle(
                  color: kPrimaryColor, //Color(0xff3f1f20),
                  fontWeight: FontWeight.w700,
                  fontFamily: "CircularStd",
                  fontStyle: FontStyle.normal,
                  fontSize: 24.sp,
                ),
                textAlign: TextAlign.left),
          ),
        ],
      ),
      actions: actionWidgets,
    );
  }

  static BoxDecoration defaultContainerDecoration() {
    return BoxDecoration(
      color: const Color(0xffffffff),
      borderRadius: BorderRadius.circular(15),
      // ignore: prefer_const_literals_to_create_immutables
      boxShadow: [
        const BoxShadow(
            color: Color(0x0c546977),
            offset: Offset(0, 3),
            blurRadius: 6,
            spreadRadius: 0)
      ],
    );
  }

  static buttonStyle() {
    return TextButton.styleFrom(
      backgroundColor: kPrimaryColor,
      minimumSize: Size(120.w, 50.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
    );
  }

  static cartIcon(
    String quantity,
  ) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SvgPicture.asset(
          "images/Cart Icon.svg",
        ),
        (quantity == "0" || quantity == '০')
            ? const Text("")
            : Positioned(
                top: -8.h,
                right: -4.w,
                child: Container(
                  width: 18.w,
                  height: 18.h,
                  child: Center(
                    child: Text(
                      quantity,
                      style: TextStyle(color: kWhiteColor, fontSize: 12.sp),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.r),
                    ),
                    color: Color(0xffd12e22),
                  ),
                ),
              ),
      ],
    );
  }

  static signInglobalAppBar({String? title, Color? bgColor, Widget? trailing}) {
    return AppBar(
      elevation: 0.sp,
      backgroundColor: bgColor,
      title: Text(title!,
          style: TextStyle(
              color: const Color(0xff3f1f20),
              fontWeight: FontWeight.w700,
              fontFamily: "CircularStd",
              fontStyle: FontStyle.normal,
              fontSize: 24.sp),
          textAlign: TextAlign.left),
      centerTitle: false,
      actions: [trailing!],
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          );
        },
      ),
    );
  }

  static textFormField(
      {int? line,
      bool obsCureText = false,
      FocusNode? focusNode,
      TextInputType textInputType = TextInputType.text,
      TextEditingController? controller,
      String? labelText,
      String? Function(String?)? validator,
      Widget? suffixIcon}) {
    return TextFormField(
        focusNode: focusNode,
        maxLines: line,
        obscureText: obsCureText,
        obscuringCharacter: '*',
        controller: controller,
        cursorColor: Colors.black,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: const Color(0xfff2f2f2),
          suffixIcon: suffixIcon,
          labelStyle: const TextStyle(
              color: Color(0xff808080),
              fontWeight: FontWeight.w400,
              fontFamily: "CircularStd",
              fontStyle: FontStyle.normal,
              fontSize: 16),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(style: BorderStyle.none),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
        ),
        validator: validator);
  }

  static defaultButton(
      {required void Function()? press, required String text}) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: TextButton(
        style: buttonStyle(),
        onPressed: press,
        child: Text(text,
            style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.normal,
                color: Colors.white)),
      ),
    );
  }

  static buildPopupDialog(BuildContext context, String description) {
    return new AlertDialog(
      title: Text(
        'Category Description',
        style: GoogleFonts.poppins(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            description.isEmpty == true ? "No description found" : description,
            maxLines: 30,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 12.sp),
          ),
        ],
      ),
      actions: <Widget>[
        Align(
          alignment: Alignment.center,
          child: new ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Close',
                style: GoogleFonts.poppins(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
              ),
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  primary: kPrimaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  textStyle: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal))),
        ),
      ],
    );
  }
}
