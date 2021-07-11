import 'package:ecommerce_app/Util/Enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
  TextWidget({required this.arr, required this.imageArr});

  final List<String> arr, imageArr;

  @override
  Widget build(BuildContext context) {
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
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: list);
  }
}
