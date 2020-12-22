import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HotTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "HOT",
      style: Get.textTheme.headline5.copyWith(
        fontWeight: FontWeight.normal,
      ),
      textAlign: TextAlign.center,
    );
  }
}
