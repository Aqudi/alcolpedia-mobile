import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/hot_contents_provider.dart';
import '../../../utils/hex_color.dart';
import '../../../widgets/alcol_scaffold.dart';
import '../hot/local_widgets/widgets.dart';
import '../local_widgets/content_card_grid.dart';

class HotPage extends HookWidget {
  final contentLength = 6;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read(hotContentsViewModel).initState(contentLength);
      return context.read(hotContentsViewModel).dispose;
    }, []);

    final contents = useProvider(hotContentsProvider).state;

    if (contents == null) {
      return Container(child: const Center(child: CircularProgressIndicator()));
    }
    return AlcolScaffold(
      appBarBackgroundColor: Colors.transparent,
      appBarTitle: true,
      body: Container(
        decoration: BoxDecoration(color: HexColor("#F8F4E7")),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Expanded(
              flex: 0,
              child: HotTitle(),
            ),
            SizedBox(height: 13),
            Expanded(
              flex: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HotHashChip(tag: "술게임"),
                  HotHashChip(tag: "BGM"),
                  HotHashChip(tag: "폭탄주"),
                  HotHashChip(tag: "건배사"),
                  HotHashChip(tag: "옵션"),
                ],
              ),
            ),
            SizedBox(height: 13),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: ContentCardGridView(contents: contents),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIcon(IconData icon, int info) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Row(
        children: [
          Icon(icon, size: 16),
          Text(":$info"),
        ],
      ),
    );
  }
}
