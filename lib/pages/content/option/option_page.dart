import 'package:flutter/material.dart';

import '../../../utils/palette.dart';
import '../local_widgets/content_scaffold.dart';
import '../local_widgets/content_title.dart';

class OptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentScaffold(
      appBarBackgroundColor: darkGreen,
      contentTitle: ContentTitle(
        iconData: Icons.settings,
        title: "게임에 옵션을 걸자",
      ),
    );
  }
}
