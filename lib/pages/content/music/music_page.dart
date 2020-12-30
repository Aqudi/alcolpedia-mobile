import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/content_provider.dart';
import '../../../utils/content_type.dart';
import '../../../utils/palette.dart';
import '../local_widgets/content_scaffold.dart';
import '../local_widgets/content_title.dart';
import 'music_content_list.dart';

final musicsProvider = getContentsProvider();
final musicsViewModel = getContentsViewModel(musicsProvider);

class MusicPage extends HookWidget {
  final contentType = ContentType.bgm;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read(musicsViewModel).initState(contentType);
      return context.read(musicsViewModel).dispose;
    }, []);

    final contents = useProvider(musicsProvider).state;

    if (contents == null) {
      return Container(child: const Center(child: CircularProgressIndicator()));
    }

    return ContentScaffold(
      appBarBackgroundColor: darkGreen,
      contentTitle: ContentTitle(
        iconData: Icons.headset,
        title: "CAN YOU FELL MY HEARTBEAT?",
      ),
      body: ContentCardListView(contents: contents),
    );
  }
}
