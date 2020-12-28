import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/content.dart';
import '../../../providers/content_provider.dart';
import '../../../services/constants.dart';
import '../../../utils/content_type.dart';
import '../../../utils/palette.dart';
import '../local_widgets/content_scaffold.dart';
import '../local_widgets/content_title.dart';

final _currentContent = ScopedProvider<Content>(null);

class GameTile extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final content = useProvider(_currentContent);
    final bodyList = content.body.split("\n");
    final end = min(bodyList.length, 3);
    final body = bodyList.sublist(0, end).join("\n");
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 15,
      ),
      child: Card(
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              child: CachedNetworkImage(
                imageUrl: "$baseUrl${content.image}",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content.title.trimLeft(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Flexible(
                  child: MarkdownBody(
                    data: body,
                  ),
                ),
              ],
            ),
            Icon(Icons.favorite),
          ],
        ),
      ),
    );
  }
}

class GamePage extends HookWidget {
  final contentType = ContentType.game;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read(contentsViewModel).initState(contentType);
      return context.read(contentsViewModel).dispose;
    }, []);

    final contents = useProvider(contentsProvider).state;

    if (contents == null) {
      return Container(child: const Center(child: CircularProgressIndicator()));
    }

    return ContentScaffold(
      appBarBackgroundColor: darkGreen,
      contentTitle: ContentTitle(
        iconData: Icons.wine_bar,
        title: "엄준식이 좋아하는 랜덤게임",
      ),
      body: ListView.builder(
        itemCount: contents.length,
        itemBuilder: (ctx, idx) => ProviderScope(
          overrides: [
            _currentContent.overrideWithValue(contents[idx]),
          ],
          child: GameTile(),
        ),
      ),
    );
  }
}
