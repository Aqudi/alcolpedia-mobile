import 'package:alcolpedia_mobile/pages/content/local_widgets/content_scaffold.dart';
import 'package:alcolpedia_mobile/pages/content/local_widgets/content_title.dart';
import 'package:alcolpedia_mobile/utils/palette.dart';
import 'package:flutter/material.dart';

class BattleCryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentScaffold(
      appBarBackgroundColor: Palette.darkGreen,
      contentTitle: ContentTitle(
        iconData: Icons.music_note,
        title: "그대의 눈동자에 Cheers",
      ),
    );
  }
}
