import 'package:ecommerce_app/MVC/View/AccoutModule/AccountPage.dart';
import 'package:ecommerce_app/MVC/View/Cart/CartPage.dart';
import 'package:ecommerce_app/MVC/View/CategoryDetailsModule/CategoryDetailsPage.dart';
import 'package:ecommerce_app/MVC/View/DetailsModule/ProductDetailPage.dart';
import 'package:ecommerce_app/MVC/View/FavouriteModule/favouritePage.dart';
import 'package:ecommerce_app/MVC/View/HomeModule/Components/SeeMore/popular_products_see_more.dart';
import 'package:ecommerce_app/MVC/View/HomeModule/HomePage.dart';
import 'package:ecommerce_app/MVC/View/OrderHistoryModule/OrderHistoryPage.dart';
import 'package:ecommerce_app/MVC/View/OtpModule/OtpPage.dart';
import 'package:ecommerce_app/MVC/View/PaymentModule/PaymentPage.dart';
import 'package:ecommerce_app/MVC/View/SignInModule/SignInPage.dart';
import 'package:ecommerce_app/MVC/View/SplashModule/SplashPage.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String HOMEPAGE = "HomePage";
  static String SPLASHPAGE = "SpalshPage";
  static String PRODUCT_DETAIL_PAGE = "product_details_page";
  static String CART_PAGE = "cart_page";
  static String OTP_PAGE = "otp_PAGE";
  static String SIGNIN_PAGE = "SignIn_page";
  static String PAYMENT_PAGE = "Payment";
  static String ACCOUNT_PAGE = "My_Account_page";
  static String CATEGORY_DETAILS_PAGE = "category_details_page";
  static String POPULAR_SEE_MORE_PAGE = "popular_see_more_page";
  static String FAVOURITE_PAGE = "favourite_page";
  static String ORDERHISTORY_PAGE = "orderHistory_page";

  static List<GetPage> AppRoutesList() {
    return [
      GetPage(name: SPLASHPAGE, page: () => SplashPage()),
      GetPage(name: HOMEPAGE, page: () => HomePage()),
      GetPage(name: PRODUCT_DETAIL_PAGE, page: () => ProductDetailPage()),
      GetPage(name: CART_PAGE, page: () => CartPage()),
      GetPage(name: OTP_PAGE, page: () => OtpPage()),
      GetPage(name: SIGNIN_PAGE, page: () => SignInPage()),
      GetPage(name: PAYMENT_PAGE, page: () => PaymentPage()),
      GetPage(name: ACCOUNT_PAGE, page: () => AccountPage()),
      GetPage(name: CATEGORY_DETAILS_PAGE, page: () => CategoryDetailsPage()),
      GetPage(
          name: POPULAR_SEE_MORE_PAGE, page: () => PopularProductsSeeMore()),
      GetPage(name: FAVOURITE_PAGE, page: () => FavouritePage()),
      GetPage(name: ORDERHISTORY_PAGE, page: () => OrderHistoryPage())
    ];
  }
}
