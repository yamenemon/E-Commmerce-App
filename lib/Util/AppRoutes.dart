import 'package:ecommerce_app/MVC/View/Home/Home.dart';
import 'package:get/get.dart';

class AppRoutes {
  static var HOMEPAGE = "homepage";
  // static String PRODUCT_DETAIL_PAGE = "product_details_page";
  // static String EMPTY_CART_PAGE = "empty_cart_page";
  // static String CART_PAGE = "cart_page";
  // static String ACCOUNT_PAGE = "My_Account_page";
  // static String ADDRESS_PAGE = "My_Address_page";
  // static String NEW_ADDRESS_PAGE = "New_Address_page";
  // static String CHOOSE_LOCATION_PAGE = "Choose_Location";
  // static String SIGNIN_PAGE = "SignIn_page";
  // static String SIGNUP_PAGE = "Sign_Up_PAGE";
  // static String MY_ORDER_PAGE = "MY_ORDER_PAGE";
  // static String ORDER_HISTORY_PAGE = "ORDER_HISTORY_PAGE";
  // static String OTP_PAGE = "OTP_PAGE";
  // static String EDIT_PROFILE_PAGE = "EDIT_PROFILE_PAGE";

  static List<GetPage> AppRoutesList() {
    return [
      GetPage(name: HOMEPAGE, page: () => HomePage()),
      // GetPage(name: PRODUCT_DETAIL_PAGE, page: () => ProductDetailPage()),
      // GetPage(name: EMPTY_CART_PAGE, page: () => EmptyCartPage()),
      // GetPage(
      //   name: CART_PAGE,
      //   page: () => CartListPage(),
      // ),
      // GetPage(name: ACCOUNT_PAGE, page: () => AccountPage()),
      // GetPage(name: ADDRESS_PAGE, page: () => MyAddressPage()),
      // GetPage(name: NEW_ADDRESS_PAGE, page: () => NewAddressPage()),
      // GetPage(name: CHOOSE_LOCATION_PAGE, page: () => ChooseLocationPage()),
      // GetPage(name: SIGNIN_PAGE, page: () => SignInPage()),
      // GetPage(name: SIGNUP_PAGE, page: () => SignUpPage()),
      // GetPage(name: MY_ORDER_PAGE, page: () => MyOrderPage()),
      // GetPage(name: ORDER_HISTORY_PAGE, page: () => OrderHistoryPage()),
      // GetPage(name: OTP_PAGE, page: () => OtpPage()),
      // GetPage(name: EDIT_PROFILE_PAGE, page: () => EditProfilePage()),
    ];
  }
}
