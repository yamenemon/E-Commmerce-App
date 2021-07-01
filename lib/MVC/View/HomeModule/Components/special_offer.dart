import 'package:ecommerce_app/MVC/Controller/GetController.dart';
import 'package:ecommerce_app/Repository/MyRepository.dart';
import 'package:ecommerce_app/Util/AppUrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  SpecialOffers({
    Key? key,
  }) : super(key: key);
  GetController _getController =
      Get.put(GetController(repository: MyRepository()));
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SectionTitle(
            title: "Special for you",
            press: () {},
          ),
        ),
        SizedBox(height: 15.h),
        Obx(
          () => Container(
            width: Get.width,
            height: 120.h,
            child: _getController.isLoading.value == true
                ? Text("")
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    // _getController.getModelList.value.offerList!.length,
                    itemBuilder: (contex, index) => SpecialOfferCard(
                      image:
                          "$BASE_URL/${_getController.getModelList.value.offerList![0].image!}",
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
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
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
                // Image.network(
                //   image,
                //   fit: BoxFit.fill,
                // ),
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
