import 'package:alcolpedia_mobile/widgets/alcol_appbar.dart';
import 'package:alcolpedia_mobile/widgets/alcol_content_menu.dart';
import 'package:alcolpedia_mobile/widgets/alcol_profile_menu.dart';
import 'package:flutter/material.dart';

class AlcolScaffold extends StatelessWidget {
  final Widget body;
  final bool appBarTitle;

  const AlcolScaffold({Key key, this.body, this.appBarTitle = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        drawerScrimColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        appBar: AlcolAppBar(
          showTitle: appBarTitle,
        ),
        drawer: AlcolContentMenu(),
        endDrawer: AlcolProfileMenu(),
        body: body,
      ),
    );
  }
}
