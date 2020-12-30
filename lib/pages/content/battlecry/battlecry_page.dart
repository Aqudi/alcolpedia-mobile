import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/content_provider.dart';
import '../../../utils/content_type.dart';
import '../../../utils/palette.dart';
import '../local_widgets/content_scaffold.dart';
import '../local_widgets/content_title.dart';
import 'battlecry_content_list.dart';

final battlecryProvider = getContentsProvider();
final battlecryViewModel = getContentsViewModel(battlecryProvider);

class BattleCryPage extends HookWidget {
  final contentType = ContentType.cheers;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read(battlecryViewModel).initState(contentType);
      return context.read(battlecryViewModel).dispose;
    }, []);

    final contents = useProvider(battlecryProvider).state;

    if (contents == null) {
      return Container(child: const Center(child: CircularProgressIndicator()));
    }

    return ContentScaffold(
      appBarBackgroundColor: darkGreen,
      contentTitle: ContentTitle(
        iconData: Icons.music_note,
        title: "그대의 눈동자에 Cheers",
      ),
      body: ContentCardListView(contents: contents),
    );
  }
}
