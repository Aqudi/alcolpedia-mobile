import 'package:alcolpedia_mobile/pages/content/local_widgets/content_scaffold.dart';
import 'package:alcolpedia_mobile/pages/content/local_widgets/content_title.dart';
import 'package:alcolpedia_mobile/utils/palette.dart';
import 'package:flutter/material.dart';

class OptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentScaffold(
      appBarBackgroundColor: Palette.darkGreen,
      contentTitle: ContentTitle(
        iconData: Icons.settings,
        title: "게임에 옵션을 걸자",
      ),
    );
  }
}
