import 'package:alcolpedia_mobile/pages/content/hot/local_widgets/hot_title.dart';
import 'package:alcolpedia_mobile/utils/hex_color.dart';
import 'package:alcolpedia_mobile/utils/palette.dart';
import 'package:alcolpedia_mobile/widgets/alcol_hash_chip.dart';
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
            HotTitle(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AlcolHashChip(tag: "술게임"),
                AlcolHashChip(tag: "BGM"),
                AlcolHashChip(tag: "폭탄주"),
                AlcolHashChip(tag: "건배사"),
                AlcolHashChip(tag: "옵션"),
              ],
            ),
            Container(
              height: Get.height * 0.7,
              child: Column(
                children: List.generate(
                  Get.height * 0.7 ~/ 70,
                  (index) => Container(
                    height: 55,
                    width: Get.width * 0.8,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 10,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    decoration: BoxDecoration(
                      color: HexColor("#BEC6A9"),
                      border: Border.all(
                        color: HexColor("#C59D9D"),
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              "술게임",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "술게임",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.thumb_up),
                              Icon(Icons.favorite),
                            ],
                          ),
                        ),
                      ],
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
}
