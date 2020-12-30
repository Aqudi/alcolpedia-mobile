import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

import '../../../providers/content_provider.dart';
import '../../../utils/content_type.dart';
import '../../../utils/palette.dart';
import '../local_widgets/content_card_grid.dart';
import '../local_widgets/content_scaffold.dart';
import '../local_widgets/content_title.dart';

final optionsProvider = getContentsProvider();
final optionsViewModel = getContentsViewModel(optionsProvider);

class OptionPage extends HookWidget {
  final contentType = ContentType.setting;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read(optionsViewModel).initState(contentType);
      return context.read(optionsViewModel).dispose;
    }, []);

    final contents = useProvider(optionsProvider).state;

    if (contents == null) {
      return Container(child: const Center(child: CircularProgressIndicator()));
    }

    return ContentScaffold(
      appBarBackgroundColor: darkGreen,
      contentTitle: ContentTitle(
        iconData: Icons.settings,
        title: "게임에 옵션을 걸자",
      ),
      body: ContentCardGridView(contents: contents),
    );
  }
}
