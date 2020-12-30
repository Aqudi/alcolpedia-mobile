import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

import '../../../providers/content_provider.dart';
import '../../../utils/content_type.dart';
import '../../../utils/palette.dart';
import '../local_widgets/content_card_grid.dart';
import '../local_widgets/content_scaffold.dart';
import '../local_widgets/content_title.dart';

final recipesProvider = getContentsProvider();
final recipesViewModel = getContentsViewModel(recipesProvider);

class RecipePage extends HookWidget {
  final contentType = ContentType.alcohol;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read(recipesViewModel).initState(contentType);
      return context.read(recipesViewModel).dispose;
    }, []);

    final contents = useProvider(recipesProvider).state;
    print(contents);

    if (contents == null) {
      return Container(child: const Center(child: CircularProgressIndicator()));
    }

    return ContentScaffold(
      appBarBackgroundColor: darkGreen,
      contentTitle: ContentTitle(
        iconData: Icons.science,
        title: "폭탄주 레시피",
      ),
      body: ContentCardGridView(contents: contents),
    );
  }
}
