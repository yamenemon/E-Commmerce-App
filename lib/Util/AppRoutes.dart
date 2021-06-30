import 'package:ecommerce_app/MVC/View/AccoutModule/AccountPage.dart';
import 'package:ecommerce_app/MVC/View/Cart/CartPage.dart';
import 'package:ecommerce_app/MVC/View/CategoryDetailsModule/CategoryDetailsPage.dart';
import 'package:ecommerce_app/MVC/View/DetailsModule/ProductDetailPage.dart';
import 'package:ecommerce_app/MVC/View/HomeModule/HomePage.dart';
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
  static String OTP_PAGE = "OTP_PAGE";
  static String SIGNIN_PAGE = "SignIn_page";
  static String PAYMENT_PAGE = "Payment";
  static String ACCOUNT_PAGE = "My_Account_page";
  static String CATEGORY_DETAILS_PAGE = "category_details_page";

  // static String ADDRESS_PAGE = "My_Address_page";
  // static String NEW_ADDRESS_PAGE = "New_Address_page";
  // static String CHOOSE_LOCATION_PAGE = "Choose_Location";

  // static String MY_ORDER_PAGE = "MY_ORDER_PAGE";
  // static String ORDER_HISTORY_PAGE = "ORDER_HISTORY_PAGE";

  // static String EDIT_PROFILE_PAGE = "EDIT_PROFILE_PAGE";

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

      // GetPage(name: ADDRESS_PAGE, page: () => MyAddressPage()),
      // GetPage(name: NEW_ADDRESS_PAGE, page: () => NewAddressPage()),
      // GetPage(name: CHOOSE_LOCATION_PAGE, page: () => ChooseLocationPage()),

      // GetPage(name: SIGNUP_PAGE, page: () => SignUpPage()),
      // GetPage(name: MY_ORDER_PAGE, page: () => MyOrderPage()),
      // GetPage(name: ORDER_HISTORY_PAGE, page: () => OrderHistoryPage()),

      // GetPage(name: EDIT_PROFILE_PAGE, page: () => EditProfilePage()),
    ];
  }
}
