import 'package:alcolpedia_mobile/utils/Routes.dart';
import 'package:alcolpedia_mobile/utils/app_router.dart';
import 'package:alcolpedia_mobile/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(AlcolpediaApp());
}

class AlcolpediaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Alcolpedia',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      getPages: AppRouter.route,
      initialRoute: Routes.homePage,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryIconTheme: IconThemeData(
          color: HexColor("#707070"),
          size: 2000,
        ),
      ),
    );
  }
}
