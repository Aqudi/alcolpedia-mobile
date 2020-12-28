import 'package:alcolpedia_mobile/utils/hex_color.dart';
import 'package:alcolpedia_mobile/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double fontSize = 20;
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 34),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: HexColor("#F5F5F5"),
          enabledBorder: Get.theme.inputDecorationTheme.border,
          focusedBorder: Get.theme.inputDecorationTheme.border,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(2),
            child: Icon(
              Icons.search,
              color: Palette.primaryGreen,
              size: fontSize,
            ),
          ),
          hintText: "검색",
          contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
        ),
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
