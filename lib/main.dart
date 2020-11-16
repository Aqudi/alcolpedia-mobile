import 'package:alcolpedia_mobile/utils/Routes.dart';
import 'package:alcolpedia_mobile/utils/app_router.dart';
import 'package:alcolpedia_mobile/utils/palette.dart';
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
          color: Palette.primaryGreen,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.primaryGreen, width: 2.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        textTheme: TextTheme(
          headline5: TextStyle(
            color: Palette.primaryGreen.withOpacity(1),
          ),
        ),
      ),
    );
  }
}
