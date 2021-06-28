import 'package:ecommerce_app/ApiProvider/ApiClient.dart';
import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/MVC/Controller/CommonController.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:ecommerce_app/Util/Language/Translation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  initServices();
  runApp(const MyApp());
}

initServices() async {
  await Get.putAsync<ApiClient>(() => ApiClient().init());
  Get.put<CartController>(CartController(), permanent: true);
  Get.put<CommonController>(CommonController(), permanent: true);
  // await Get.putAsync<AppDb>(() => AppDb.init());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 820), // Zeplin UI size
      builder: () => GetMaterialApp(
        translations: LocalizationService(),
        fallbackLocale: LocalizationService.fallbackLocale,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.SPLASHPAGE,
        getPages: AppRoutes.AppRoutesList(),
        title: 'E-Commerce-App',
        locale: Get.deviceLocale,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          // fontFamily: 'CircularStd',
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kWhiteColor,
          backgroundColor: kBackgroundColor,
        ),
      ),
    );
  }
}
