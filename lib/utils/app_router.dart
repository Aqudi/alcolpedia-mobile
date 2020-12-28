import 'package:get/get.dart';
import '../pages/pages.dart';
import '../utils/app_routes.dart';

final routes = [
  // home
  GetPage(name: AppRoutes.homePage, page: () => HomePage()),

  // auth
  GetPage(name: AppRoutes.loginPage, page: () => LoginPage()),
  GetPage(name: AppRoutes.signupPage, page: () => SignupPage()),

  // content
  GetPage(name: AppRoutes.hotPage, page: () => HotPage()),
  GetPage(name: AppRoutes.gamePage, page: () => GamePage()),
  GetPage(name: AppRoutes.musicPage, page: () => MusicPage()),
  GetPage(name: AppRoutes.recipePage, page: () => RecipePage()),
  GetPage(name: AppRoutes.battlecryPage, page: () => BattleCryPage()),
  GetPage(name: AppRoutes.optionPage, page: () => OptionPage()),

  // customer
  GetPage(name: AppRoutes.claimPage, page: () => ClaimPage()),
  GetPage(name: AppRoutes.profilePage, page: () => ProfilePage()),
];
