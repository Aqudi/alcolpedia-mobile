import 'package:flutter/material.dart';

import '../../../utils/palette.dart';
import '../local_widgets/content_scaffold.dart';
import '../local_widgets/content_title.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentScaffold(
      appBarBackgroundColor: darkGreen,
      contentTitle: ContentTitle(
        iconData: Icons.wine_bar,
        title: "엄준식이 좋아하는 랜덤게임",
      ),
    );
  }
}
