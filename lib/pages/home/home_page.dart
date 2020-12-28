import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/background_gradient.dart';
import '../../utils/palette.dart';
import '../../widgets/alcol_hash_chip.dart';
import '../../widgets/alcol_scaffold.dart';
import 'local_widgets/home_searchbar.dart';
import 'local_widgets/home_title.dart';
import 'local_widgets/widgets.dart';

class HomePage extends StatelessWidget {
  final Faker faker = Faker();

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
                    darkGreen,
                    green,
                    ivory,
                    beige,
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
