import 'package:alcolpedia_mobile/pages/content/hot/local_widgets/widgets.dart';
import 'package:alcolpedia_mobile/utils/hex_color.dart';
import 'package:alcolpedia_mobile/utils/palette.dart';
import 'package:alcolpedia_mobile/widgets/alcol_scaffold.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HotPage extends StatelessWidget {
  final Faker faker = new Faker();
  @override
  Widget build(BuildContext context) {
    print(Get.height * 0.7 ~/ 50);
    return AlcolScaffold(
      appBarBackgroundColor: Colors.transparent,
      appBarTitle: true,
      body: Container(
        decoration: BoxDecoration(color: HexColor("#F8F4E7")),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Expanded(
              flex: 0,
              child: HotTitle(),
            ),
            SizedBox(height: 13),
            Expanded(
              flex: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HotHashChip(tag: "술게임"),
                  HotHashChip(tag: "BGM"),
                  HotHashChip(tag: "폭탄주"),
                  HotHashChip(tag: "건배사"),
                  HotHashChip(tag: "옵션"),
                ],
              ),
            ),
            SizedBox(height: 13),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    10,
                    (index) => Container(
                      height: 40,
                      width: Get.width * 0.8,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 10,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: HexColor("#DCE0D1").withOpacity(0.64),
                        border: Border.all(
                          color: HexColor("#C59D9D"),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              HotHashChip(tag: "술게임"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "술게임",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              build_icon(Icons.thumb_up, 10),
                              build_icon(Icons.favorite_border, 5),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build_icon(IconData icon, int info) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Row(
        children: [
          Icon(icon, size: 16),
          Text(":$info"),
        ],
      ),
    );
  }
}
