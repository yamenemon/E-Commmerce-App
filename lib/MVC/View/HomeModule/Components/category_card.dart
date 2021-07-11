import 'package:ecommerce_app/Util/TransparenImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    bool _validURL = Uri.parse(icon).isAbsolute;
    if (icon.contains(".jpg") ||
        // icon.contains(".gif") ||
        icon.contains(".png") ||
        icon.contains(".jpeg")) {
      print(icon);
    } else {
      icon =
          "https://ecommerce.tritechfirm.com/app-api/images/categories/1618600452.jpg";
    }
    print(icon);
    print(_validURL);

    return GestureDetector(
      onTap: press,
      child: Container(
        width: Get.width * 0.2,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              margin: EdgeInsets.all(1),
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
                    offset: const Offset(-1, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: icon,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            Container(
              child: Text(text,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      fontSize: 12.sp, fontWeight: FontWeight.w500)),
            )
          ],
        ),
      ),
    );
  }
}
