import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin PreferredSizeMixin implements PreferredSizeWidget {}

class AlcolAppBar extends StatelessWidget with PreferredSizeMixin {
  @override
  final Size preferredSize;

  final bool showTitle;
  final Widget titleWidget;
  final Color backgroundColor;

  AlcolAppBar({
    this.showTitle = true,
    this.titleWidget,
    this.backgroundColor,
    Key key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: appbarCenterWidet(),
      actions: <IconButton>[
        profileButton(context),
      ],
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
    );
  }

  Widget appbarCenterWidet() {
    if (showTitle) {
      return titleWidget ?? Text("ALCOLPEDIA", style: Get.textTheme.headline5);
    }
    return Text("");
  }

  Widget profileButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.person),
      onPressed: () {
        Scaffold.of(context).openEndDrawer();
      },
    );
  }
}
