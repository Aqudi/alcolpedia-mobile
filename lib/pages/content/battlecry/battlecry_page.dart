import 'package:flutter/material.dart';

import '../../../utils/palette.dart';
import '../local_widgets/content_scaffold.dart';
import '../local_widgets/content_title.dart';

class BattleCryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentScaffold(
      appBarBackgroundColor: darkGreen,
      contentTitle: ContentTitle(
        iconData: Icons.music_note,
        title: "그대의 눈동자에 Cheers",
      ),
    );
  }
}
