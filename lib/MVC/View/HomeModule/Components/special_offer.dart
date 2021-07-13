import 'package:ecommerce_app/MVC/Controller/ProductModule/GetController.dart';
import 'package:ecommerce_app/Util/AppUrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  SpecialOffers({
    Key? key,
  }) : super(key: key);
  final GetController _getController = Get.find<GetController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SectionTitle(
            title: "Special for you",
            press: () {
              Get.defaultDialog(
                  title: "Special Offer",
                  middleText: "You will find New Offer very Soon",
                  onConfirm: () {
                    Get.back();
                  });
            },
          ),
        ),
        SizedBox(height: 15.h),
        Obx(
          () => Container(
            width: Get.width,
            height: 120.h,
            child: _getController.isLoading.value == true
                ? Text("")
                : _getController.getModelList.value.offerList == null
                    ? Center(child: Text("Internet or Server problem"))
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        // _getController.getModelList.value.offerList!.length,
                        itemBuilder: (contex, index) => SpecialOfferCard(
                          image:
                              "$BASE_URL/${_getController.getModelList.value.offerList![0].image.toString()}",
                          category: _getController
                              .getModelList.value.offerList![0].title!,
                          numOfBrands: 18,
                          press: () {},
                        ),
                      ),
          ),
        ),

        // SpecialOfferCard(
        //   image: "images/Image Banner 3.png",
        //   category: "Fashion",
        //   numOfBrands: 24,
        //   press: () {},
        // ),
        SizedBox(width: 15.w),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    print(image);

    if (!image.contains(".jpg") || !image.contains(".jpeg")) {
      image =
          "https://ecommerce.tritechfirm.com/app-api/images/categories/1618875207.jpg";
    }
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: Get.width * 0.6.w,
          height: Get.height * 0.15.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Stack(
              children: [
                Image.network(
                  image.toString(),
                  fit: BoxFit.fill,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF343434).withOpacity(0.4),
                        const Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 10.h,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
