// ignore: file_names
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
      title: Row(
        children: [
          isBackBtn == true
              ? IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                )
              : Container(),
          Text(title.tr,
              style: const TextStyle(
                color: kPrimaryColor, //Color(0xff3f1f20),
                fontWeight: FontWeight.w700,
                fontFamily: "CircularStd",
                fontStyle: FontStyle.normal,
                fontSize: 24,
              ),
              textAlign: TextAlign.left),
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

  static cartIcon(
    String quantity,
  ) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SvgPicture.asset(
          "images/cart.svg",
        ),
        (quantity == "0" || quantity == '০')
            ? const Text("")
            : Positioned(
                top: -4,
                right: -4,
                child: Container(
                  width: 22,
                  height: 22,
                  child: Center(
                    child: Text(
                      quantity,
                      style: const TextStyle(color: kWhiteColor, fontSize: 12),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    color: Color(0xffd12e22),
                  ),
                ),
              ),
      ],
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
}
