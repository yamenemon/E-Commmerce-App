class LocalizationLanguage {
  static final SIGN_UP_TEXT = 'sign_up';
  static final SIGN_IN_TEXT = 'sign_in';
  static final SIGN_IN__BAN_TEXT = 'sign_in_ban';
  static final PHONE_NUM_TEXT = 'phone_number';
  static final PHONE_NUM_TEXT_REQ = "phone_number_req";
  static final PASSWORD_TEXT = "password";
  static final PASSWORD_REQ_TEXT = "password_req";
  static final DONT_AC_TEXT = "dont_ac";
  static final LANGUGAGE_TEXT = "language";
  static final MYACCOUNT_TEXT = "my_account";
  static final EDIT_PROFILE_TEXT = "edit_profile";
  static final ORDER_HISTORY_TEXT = "order_history";
  static final MY_ORDER_TEXT = "my_order";
  static final MYADDRESS_TEXT = "my_address";
  static final LOGIN_TEXT = "log_in";
  static final PRODUCTLIST_TEXT = "product_list";
  static final SIGNUP_BAN_TEXT = "sign_up_ban";
  static final ENTER_NAME_TEXT = "enter_name";
  static final ENTER_NAME_REQ_TEXT = "enter_name_req";
  static final ENTER_PHONENUM_TEXT = "enter_phn";
  static final ENTER_PHONENUM_REQ_TEXT = "enter_phn_req";
  static final ENTER_EMAIL_TEXT = 'enter_email';
  static final OPTIONAL_TEXT = 'optional';
  static final ENTER_PASSWORD_TEXT = 'enter_pass';
  static final ENTER_PASSWORD_REQ_TEXT = 'enter_pass_req';
  static final ENTER_RETYPEPASSWORD_TEXT = 'retype_pass';
  static final ENTER_RETYPEPASSWORD_REQ_TEXT = 'retype_pass_req';
  static final MATCH_PASSWORD_TEXT = 'match_pass';
  static final ALREADY_AC_TEXT = 'already_ac';
  static final OTP_TEXT = 'otp';
  static final OTP_BAN_TEXT = 'otp_ban';
  static final SENT_TEXT = 'sent_num';
  static final RESENT_OTP_TEXT = 'resent_otp';
  static final VERIFY_NOW_TEXT = 'verify_now';
  static final CONFIRM_ADDRESS_TEXT = 'confirm_address';
  static final ADD_NEWADDRESS_TEXT = 'add_new_address';
  static final SAVE_TEXT = 'save';
  static final PIECES_TEXT = 'pieces';
  static final UNIT_PRICE_TEXT = 'unit_price';
  static final TOTAL_PRICE_TEXT = 'total_price';
  static final ADD_CART_TEXT = 'add_cart';
  static final PRODUCT_DES_TEXT = 'product_des';
  static final CART_TEXT = 'cart';
  static final ITEM_ADDED_TEXT = 'item_added';
  static final DELIVERY_TEXT = 'delivery_date';
  static final CHANGE_TEXT = 'change';
  static final DELIVERY_ADDRESS = 'delivery_address';
  static final NO_ADDRESS_ADDED_TEXT = 'no_address';
  static final ADD_ADDRESS_TEXT = 'add_address';
  static final CONFIRM_ORDER_TEXT = 'confirm_order';
  static final PRODUCT_ADDED_TEXT = 'product_added';
  static final NAME_TEXT = 'name';
  static final MOBILE_TEXT = 'mobile';
  static final MOBILE_TEXT_REQ = 'mobile_req';
  static final EMAIL_TEXT = 'email';
  static final EMPTY_CART_TEXT = 'empty_cart';
  static final EMPTY_CART_BODY_TEXT = 'empty_cart_txt';
  static final GO_HOME_TEXT = 'go_home';
  static final CHOOSE_LOCATION_TEXT = 'ch_location';
  static final SAVE_ADDRESS_TEXT = 'save_address';
  static final ZOOM_MOVE_TEXT = 'zoom_move';
  static final EDIT_ADDRESS_TEXT = 'edit_address';
  static final NEXT_TEXT = 'next';
  static final ADDRESSTITLE_TEXT = 'address_title';
  static final ADDRESSTITLE_REQ_TEXT = 'address_title_req';
  static final ENTER_ADDRESS_TEXT = 'enter_address';
  static final ENTER_ADDRESS_REQ_TEXT = 'enter_address_req';
  static final PRODUCTNAME_TEXT = 'pr_name';

  static Map<String, String> bn = {
    //HomePage
    'product_list': 'পন্যের তালিকা',
    "pieces": 'পিস',

    //MyAccount
    'my_account': 'আমার অ্যাকাউন্ট',
    'my_order': 'আমার অর্ডার',
    'order_history': 'অর্ডার হিসটোরি',
    'edit_profile': 'প্রোফাইল ইডিট',
    'my_address': 'আমার ঠিকানা',
    'log_in': 'লগইন',

    //SignInpage
    'sign_up': 'সাইন আপ',
    'sign_in': 'সাইন ইন',
    'sign_in_ban': 'ক্রয় চালিয়ে যেতে দয়া করে সাইন ইন করুন',
    'phone_number': 'ফোন নম্বর',
    'phone_number_req': 'ফোন নম্বর প্রয়োজনীয়',
    'password': 'পাসওয়ার্ড',
    'password_req': 'পাসওয়ার্ড প্রয়োজনীয়',
    'dont_ac': 'একটি অ্যাকাউন্ট নেই? ',

    //Signup
    'sign_up_ban': 'ক্রয় চালিয়ে যেতে প্রথমে সাইন আপ করুন',
    'enter_name': 'নাম প্রবেশ করান',
    'enter_name_req': "নাম প্রয়োজনীয়",
    'enter_phn': "ফোন নম্বর",
    'enter_phn_req': 'ফোন নম্বর প্রয়োজনীয়',
    'enter_email': "ইমেইল প্রদান করুন",
    'optional': '*অপশনাল',
    'enter_pass': "পাসওয়ার্ড লিখুন",
    'enter_pass_req': "পাসওয়ার্ড প্রয়োজনীয়",
    'retype_pass': "পাসওয়ার্ড পুনরায় টাইপ করুন",
    'retype_pass_req': "পুনরায় টাইপ পাসওয়ার্ড প্রয়োজন",
    'match_pass': "পাসওয়ার্ড মিলেনি",
    'already_ac': "ইতিমধ্যে একটি সদস্যপদ আছে? ",

    //OtpPage
    'otp': "ওটিপি প্রবেশ করান",
    'otp_ban': "নিবন্ধকরণ সম্পূর্ণ করার জন্য ফোন নম্বর যাচাই করুন",
    'sent_num': "আমরা আপনাকে +880 1716609650 এ একটি ওটিপি প্রেরণ করেছি",
    'resent_otp': 'ওটিপি পুনরায় পাঠান',
    'verify_now': "এখন সনাক্ত করুন",

    //MyAddressPage
    'confirm_address': "ঠিকানা নিশ্চিত করুন",
    'add_new_address': "নতুন ঠিকানা যোগ করুন",

    //EditProfilePage
    'save': "সংরক্ষণ",
    'name': 'নাম',
    'mobile': 'মোবাইল',
    'mobile_req': "মোবাইল নাম্বার দরকার",
    'email': 'ইমেল',

    //ProductDetailsPage
    'unit_price': "একক দাম",
    'total_price': "মোট দাম",
    'add_cart': "কার্টে অ্যাড করুন",
    'product_des': "পণ্যের বর্ণনা:",
    'cart': 'কার্ট',
    'item_added': "আইটেমটি ইতিমধ্যে যুক্ত করা হয়েছে",

    //CartItem Page
    'delivery_date': "ডেলিবেরি তারিখ",
    'change': "পরিবর্তন",
    'delivery_address': "ডেলিবেরি ঠিকানা",
    "no_address": "ঠিকানা যুক্ত করা হয়নি",
    'add_address': "ঠিকানা যোগ করুন",
    'confirm_order': "অর্ডার নিশ্চিত করুন",
    'product_added': "পণ্য যুক্ত করা হয়েছে",

    //EmptyCart
    'empty_cart': "খালি কার্ট",
    'empty_cart_txt':
        "তোমার থলে তো খালি. আপনি আপনার কার্টে এখনও কিছু যোগ করেন নি",
    'go_home': "হোমে যাও",

    //ChooseLocation
    'ch_location': "অবস্থান চয়ন করুন",
    'save_address': "ঠিকানা সংরক্ষণ করুন",
    'zoom_move': "জুম এবং সঠিক অবস্থানটি সামঞ্জস্য করতে সরান",

    //AddNewAddressPage
    'edit_address': "ঠিকানা সম্পাদনা করুন",
    'next': "পরবর্তী",
    'address_title': 'ঠিকানার শিরোনাম',
    'address_title_req': "ঠিকানার শিরোনাম প্রয়োজন",
    'enter_address': 'ঠিকানা লিখুন',
    'enter_address_req': "ঠিকানা প্রয়োজন",

    //Other
    'language': "ভাষা",
    'pr_name': "বসুন্ধরা রুটি খেতে প্রস্তুত"
  };

  static Map<String, String> en = {
    //HomePage
    'product_list': 'PRODUCT LIST',
    "pieces": 'pieces',

    //MyAccount
    'my_account': 'My Account',
    'my_order': 'My Order',
    'order_history': 'Order History',
    'edit_profile': 'Edit Profile',
    'my_address': 'My Address',
    'log_in': 'Log In',

    //SignInpage
    'sign_up': 'Sign up',
    'sign_in': 'Sign in',
    'sign_in_ban': 'Please Sign in to continue purchase',
    'phone_number': 'Phone Number',
    'phone_number_req': 'Phone Number is Required',
    'password': 'Password',
    'password_req': 'Password is Required',
    'dont_ac': 'Don’t have an account? ',

    //Signup
    'sign_up_ban': 'Please Sign up first to continue purchase',
    'enter_name': 'Enter name',
    'enter_name_req': "Name is Required",
    'enter_phn': "Enter phone number",
    'enter_phn_req': "Phone number is Required",
    'enter_email': "Enter email",
    'optional': "*Optional",
    'enter_pass': "Enter password",
    'enter_pass_req': "Password is Required",
    'retype_pass': "Retype password",
    'retype_pass_req': "Retype Password is Required",
    'match_pass': "Password is not match",
    'already_ac': "Already have an account? ",

    //OtpPage
    'otp': "Enter OTP",
    'otp_ban': "Verify phone number for complete the registration",
    'sent_num': "We have sent you an OTP to +880 1716609650",
    'resent_otp': 'Resend OTP',
    'verify_now': "Verify now",

    //MyAddressPage
    'confirm_address': "Confirm address",
    'add_new_address': "Add New Address",

    //EditProfilePage
    'save': "Save",
    'name': 'Name',
    'mobile': 'Mobile',
    'mobile_req': "Mobile is Required",
    'email': 'Email',

    //ProductDetailsPage
    'unit_price': "Unit Price",
    'total_price': "Total Price",
    'add_cart': "Add to Cart",
    'product_des': "Product Description:",
    'cart': 'Cart',
    'item_added': "Item is added already",

    //CartItem Page
    'delivery_date': "Delivery Date",
    'change': "Change",
    'delivery_address': "Delivery Address",
    "no_address": "No address added yet",
    'add_address': "Add Address",
    'confirm_order': "Confirm Order",
    'product_added': "Product added",

    //EmptyCart
    'empty_cart': "Empty Cart",
    'empty_cart_txt':
        "Your cart is empty. You haven’t added anything to your cart yet",
    'go_home': "Go Home",

    //ChooseLocation
    'ch_location': "Choose location",
    'save_address': "Save Address",
    'zoom_move': "Zoom and move to adjust the exact location",

    //AddNewAddressPage
    'edit_address': "Edit Address",
    'next': "Next",
    'address_title': 'Address Title',
    'address_title_req': "Address Title is Required",
    'enter_address': 'Enter Address',
    'enter_address_req': "Enter Address is Required",

    //Other
    'language': "Language",
    'pr_name': "Bashundhara ready to eat ruti"
  };
}
