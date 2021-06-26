// ignore: file_names
import 'dart:ui';
import 'package:ecommerce_app/Util/Language/LocalizationLanguage.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  // here we need to add our default language
  static const locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('bn', 'BD');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'বাংলা',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
    const Locale('bn', 'BD'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': LocalizationLanguage.en,
        'bn_BD': LocalizationLanguage.bn,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(bool lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(bool lang) {
    if (lang == false) {
      return const Locale('en', 'US');
    } else {
      return const Locale('bn', 'BD');
    }
  }
}
