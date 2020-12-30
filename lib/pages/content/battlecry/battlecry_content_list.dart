import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:html_unescape/html_unescape.dart';

import '../../../models/content.dart';
import '../../../services/constants.dart';
import '../local_widgets/content_audio_player.dart';

final _currentContent = ScopedProvider<Content>(null);

class ContentItem extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final content = useProvider(_currentContent);

    final unescape = HtmlUnescape();
    final body =
        unescape.convert(content.body.replaceAll("/media/", "$baseUrl/media/"));
    final audio = "$baseUrl${content.audio}";

    return Container(
      child: Card(
        elevation: 2,
        child: InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: _buildLikeButtonAndText(content.like.length),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 5),
                        Text(
                          content.title.trim(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 5),
                        MarkdownBody(
                          data: body,
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                    (content.audio != null)
                        ? ContentAudioPlayer(
                            audio: audio,
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(icon) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: () {
        Get.showSnackbar(GetBar(
          title: "Notice",
          message: "현재 앱에서는 지원하지 않는 기능입니다.",
          duration: Duration(seconds: 2),
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Icon(
          icon,
          size: 25,
        ),
      ),
    );
  }

  Widget _buildLikeButtonAndText(like) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIcon(Icons.favorite_border_outlined),
        Text(
          " $like",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

class ContentCardListView extends HookWidget {
  final List<Content> contents;

  ContentCardListView({Key key, this.contents});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      shrinkWrap: true,
      itemCount: contents.length,
      itemBuilder: (ctx, idx) => ProviderScope(
        overrides: [
          _currentContent.overrideWithValue(contents[idx]),
        ],
        child: ContentItem(),
      ),
    );
  }
}
