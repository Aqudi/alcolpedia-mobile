import 'package:alcolpedia_mobile/utils/background_gradient.dart';
import 'package:alcolpedia_mobile/utils/hex_color.dart';
import 'package:alcolpedia_mobile/utils/palette.dart';
import 'package:alcolpedia_mobile/widgets/alcol_appbar.dart';
import 'package:alcolpedia_mobile/widgets/alcol_content_menu.dart';
import 'package:alcolpedia_mobile/widgets/alcol_hash_chip.dart';
import 'package:alcolpedia_mobile/widgets/alcol_profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        drawerScrimColor: Colors.transparent,
        appBar: AlcolAppBar(
          showTitle: false,
        ),
        drawer: AlcolContentMenu(),
        endDrawer: AlcolProfileMenu(),
        body: Container(
          decoration: BoxDecoration(
            gradient: BackgroundGradient(
              colors: [
                Palette.darkGreen,
                Palette.green,
                Palette.ivory,
                Palette.beige,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Get.height * 0.4,
                child: Column(
                  children: [
                    title(),
                    SizedBox(
                      height: 30,
                    ),
                    searchbar(),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.transparent),
                width: Get.width * 0.8,
                child: Wrap(
                  spacing: 10,
                  children: [
                    AlcolHashChip(tag: "hashtagChip"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget title() {
    return Text(
      "ALCOLPEDIA",
      style: Theme.of(Get.context).textTheme.headline5.copyWith(
            fontWeight: FontWeight.normal,
          ),
      textAlign: TextAlign.center,
    );
  }

  Widget searchbar() {
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
