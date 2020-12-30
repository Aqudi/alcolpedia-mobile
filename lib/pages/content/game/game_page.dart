import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/content_provider.dart';
import '../../../utils/content_type.dart';
import '../../../utils/palette.dart';
import '../local_widgets/content_card_grid.dart';
import '../local_widgets/content_scaffold.dart';
import '../local_widgets/content_title.dart';

final gamesProvider = getContentsProvider();
final gamesViewModel = getContentsViewModel(gamesProvider);

class GamePage extends HookWidget {
  final contentType = ContentType.game;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read(gamesViewModel).initState(contentType);
      return context.read(gamesViewModel).dispose;
    }, []);

    final contents = useProvider(gamesProvider).state;

    if (contents == null) {
      return Container(child: const Center(child: CircularProgressIndicator()));
    }

    return ContentScaffold(
      appBarBackgroundColor: darkGreen,
      contentTitle: ContentTitle(
        iconData: Icons.wine_bar,
        title: "엄준식이 좋아하는 랜덤게임",
      ),
      body: ContentCardGridView(contents: contents),
    );
  }
}
