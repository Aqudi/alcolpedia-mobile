import 'package:alcolpedia_mobile/pages/pages.dart';
import 'package:alcolpedia_mobile/utils/routes.dart';
import 'package:get/get.dart';

class AppRouter {
  static final route = [
    // home
    GetPage(name: Routes.homePage, page: () => HomePage()),

    // auth
    GetPage(name: Routes.loginPage, page: () => LoginPage()),
    GetPage(name: Routes.signupPage, page: () => SignupPage()),

    // content
    GetPage(name: Routes.hotPage, page: () => HotPage()),
    GetPage(name: Routes.gamePage, page: () => GamePage()),
    GetPage(name: Routes.musicPage, page: () => MusicPage()),
    GetPage(name: Routes.recipePage, page: () => RecipePage()),
    GetPage(name: Routes.battlecryPage, page: () => BattleCryPage()),
    GetPage(name: Routes.optionPage, page: () => OptionPage()),

    // customer
    GetPage(name: Routes.claimPage, page: () => ClaimPage()),
    GetPage(name: Routes.profilePage, page: () => ProfilePage()),
  ];
}
