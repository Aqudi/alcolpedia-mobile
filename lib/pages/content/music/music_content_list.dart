import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/content.dart';
import '../../../services/constants.dart';
import '../local_widgets/content_audio_player.dart';

final _currentContent = ScopedProvider<Content>(null);

class ContentItem extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final content = useProvider(_currentContent);
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLikeButtonAndText(content.like.length),
                Flexible(
                  child: Text(
                    content.title.trim(),
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildTip(content),
                      (content.audio != null)
                          ? ContentAudioPlayer(
                              audio: audio,
                            )
                          : Container(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTip(content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Material(
        elevation: 2,
        color: Colors.white,
        shape: CircleBorder(),
        child: InkWell(
          onTap: () => _showDetailDialog(content),
          customBorder: CircleBorder(),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Text("tip!", style: TextStyle(fontWeight: FontWeight.bold)),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
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
      ),
    );
  }

  void _showDetailDialog(Content content) {
    final body = content.body.replaceAll("/media/", "$baseUrl/media/");
    final audio = "$baseUrl${content.audio}";
    final alertDialog = AlertDialog(
      content: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(content.title, style: Get.theme.textTheme.headline5),
              (content.audio != null)
                  ? ContentAudioPlayer(
                      audio: audio,
                    )
                  : Container(),
              Divider(),
              Flexible(
                child: SingleChildScrollView(
                  child: MarkdownBody(
                    data: body,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              customBorder: CircleBorder(),
              child: Icon(
                Icons.close,
                size: 30,
              ),
              onTap: () {
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
    Get.dialog(alertDialog);
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
