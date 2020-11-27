import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "ALCOLPEDIA",
      style: Theme.of(Get.context).textTheme.headline5.copyWith(
            fontWeight: FontWeight.normal,
          ),
      textAlign: TextAlign.center,
    );
  }
}
