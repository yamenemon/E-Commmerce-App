import 'package:ecommerce_app/MVC/Model/OrderHistoryModel/OrderHistoryModel.dart';
import 'package:ecommerce_app/Util/AppUrl.dart';
import 'package:ecommerce_app/globalWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  final ProductList productList;
  ProductItem({Key? key, required this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          getImage(productList),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productList.nameEn.toString(),
                  style: TextStyle(
                    fontFamily: 'CircularStd',
                    color: Color(0xff000000),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  maxLines: 1,
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "\$",
                            style: TextStyle(
                              fontFamily: 'CircularStd',
                              color: Color(0xff000000),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 1.2.sp,
                            ),
                          ),
                          TextSpan(
                            text: "${productList.price.toString()}",
                            style: TextStyle(
                              fontFamily: 'CircularStd',
                              color: Color(0xff000000),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Container(
                      width: 5.w,
                      height: 5.h,
                      decoration: new BoxDecoration(
                        color: Color(0xffe0dcd4),
                        borderRadius: BorderRadius.circular(100.w),
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      " ${productList.qty}",
                      style: TextStyle(
                        fontFamily: 'CircularStd',
                        color: Color(0xff000000),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
              ],
            ),
          ),
        ],
      ),
      trailing: GlobalWidget.circularContainer(
        EdgeInsets.only(left: 8.w, right: 8.w, top: 4.h, bottom: 4.h),
        Color(0xffa87016),
        4.w,
        Text(
          "${productList.isDelivered == 0 ? "Not Deliverd" : "Delivered"}",
          style: TextStyle(
            fontFamily: 'CircularStd',
            color: Color(0xffffffff),
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}

getImage(ProductList productList) {
  return Image.network(
    "$BASE_URL/" + productList.picture.toString(),
    height: 60.h,
    width: 50.w,
    fit: BoxFit.cover,
  );
}
