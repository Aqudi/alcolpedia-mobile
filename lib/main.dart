import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/app_router.dart';
import 'utils/app_routes.dart';
import 'utils/palette.dart';

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
      defaultTransition: Transition.fadeIn,
      getPages: routes,
      initialRoute: AppRoutes.homePage,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryIconTheme: IconThemeData(
          color: primaryGreen,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: primaryGreen, width: 2.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        textTheme: TextTheme(
          headline5: TextStyle(
            color: primaryGreen.withOpacity(1),
          ),
        ),
      ),
    );
  }
}
