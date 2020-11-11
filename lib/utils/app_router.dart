import 'package:alcolpedia_mobile/pages/pages.dart';
import 'package:alcolpedia_mobile/utils/Routes.dart';
import 'package:get/get.dart';

class AppRouter {
  static final route = [
    // home
    GetPage(name: Routes.homePage, page: () => LoginPage()),

    // auth
    GetPage(name: Routes.loginPage, page: () => LoginPage()),
    GetPage(name: Routes.signupPage, page: () => SignupPage()),

    // content
    GetPage(name: Routes.gamePage, page: () => LoginPage()),
    GetPage(name: Routes.musicPage, page: () => LoginPage()),
    GetPage(name: Routes.recipePage, page: () => LoginPage()),
    GetPage(name: Routes.battlecryPage, page: () => LoginPage()),
    GetPage(name: Routes.optionPage, page: () => LoginPage()),
  ];
}
