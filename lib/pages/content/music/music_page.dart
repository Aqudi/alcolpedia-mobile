import 'package:flutter/material.dart';

import '../../../utils/palette.dart';
import '../local_widgets/content_scaffold.dart';
import '../local_widgets/content_title.dart';

class MusicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentScaffold(
      appBarBackgroundColor: darkGreen,
      contentTitle: ContentTitle(
        iconData: Icons.headset,
        title: "CAN YOU FELL MY HEARTBEAT?",
      ),
    );
  }
}
