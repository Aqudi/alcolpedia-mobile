import 'package:flutter/material.dart';
import 'alcol_appbar.dart';
import 'alcol_content_menu.dart';
import 'alcol_profile_menu.dart';

class AlcolScaffold extends StatelessWidget {
  final Widget body;
  final bool appBarTitle;
  final Widget appBartitleWidget;
  final Color appBarBackgroundColor;

  const AlcolScaffold({
    Key key,
    this.body,
    this.appBarTitle = false,
    this.appBarBackgroundColor,
    this.appBartitleWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showTitle = (appBartitleWidget != null) ? true : appBarTitle;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        drawerScrimColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        appBar: AlcolAppBar(
          showTitle: showTitle,
          titleWidget: appBartitleWidget,
          backgroundColor: appBarBackgroundColor,
        ),
        drawer: AlcolContentMenu(),
        endDrawer: AlcolProfileMenu(),
        body: body,
      ),
    );
  }
}
