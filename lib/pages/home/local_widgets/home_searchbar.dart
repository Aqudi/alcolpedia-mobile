import 'package:alcolpedia_mobile/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: HexColor("#F5F5F5"),
          enabledBorder: Theme.of(Get.context).inputDecorationTheme.border,
          focusedBorder: Theme.of(Get.context).inputDecorationTheme.border,
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
