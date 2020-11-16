import 'package:alcolpedia_mobile/pages/home/local_widgets/home_title.dart';
import 'package:alcolpedia_mobile/utils/background_gradient.dart';
import 'package:alcolpedia_mobile/utils/palette.dart';
import 'package:alcolpedia_mobile/widgets/alcol_appbar.dart';
import 'package:alcolpedia_mobile/widgets/alcol_content_menu.dart';
import 'package:alcolpedia_mobile/widgets/alcol_hash_chip.dart';
import 'package:alcolpedia_mobile/widgets/alcol_profile_menu.dart';
import 'package:alcolpedia_mobile/widgets/alcol_scaffold.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './local_widgets/widgets.dart';
import 'local_widgets/home_searchbar.dart';

class HomePage extends StatelessWidget {
  Faker faker = new Faker();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AlcolScaffold(
        appBarTitle: false,
        body: Stack(
          children: [
            Container(
              constraints: BoxConstraints(minHeight: Get.height * 0.97),
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
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * 0.2,
                  ),
                  Container(
                    child: Column(
                      children: [
                        HomeTitle(),
                        SizedBox(
                          height: 30,
                        ),
                        HomeSearchBar(),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: List.generate(40,
                          (index) => AlcolHashChip(tag: faker.person.name())),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
