import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/hex_color.dart';
import '../../../utils/palette.dart';

class HomeSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(top: 30, bottom: 5, left: 30, right: 30),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: HexColor("#F5F5F5"),
          enabledBorder: Theme.of(Get.context).inputDecorationTheme.border,
          focusedBorder: Theme.of(Get.context).inputDecorationTheme.border,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(
              Icons.search,
              color: primaryGreen,
              size: 30,
            ),
          ),
          hintText: "검색",
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        ),
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
