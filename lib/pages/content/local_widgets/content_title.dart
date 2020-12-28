import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentTitle extends StatelessWidget {
  final IconData iconData;
  final String title;

  const ContentTitle({Key key, this.iconData, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double iconSize = 35;
    final double fontSize = 20;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: iconSize,
          ),
          Text(
            title,
            style: Theme.of(Get.context).textTheme.headline5.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: fontSize,
                ),
          )
        ],
      ),
    );
  }
}
