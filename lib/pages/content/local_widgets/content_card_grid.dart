import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/content.dart';
import '../../../services/constants.dart';
import 'content_audo_player.dart';

final _currentContent = ScopedProvider<Content>(null);

class ContentItem extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final content = useProvider(_currentContent);
    return Container(
      child: Card(
        elevation: 2,
        child: InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 5,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: (content.image != null)
                          ? CachedNetworkImage(
                              imageUrl: "$baseUrl${content.image}",
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            )
                          : Container(),
                    ),
                    Column(
                      children: [
                        Text(
                          content.title.trim(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _buildLikeButtonAndText(content.like.length),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: _buildBookmarkButton(),
                ),
              ],
            ),
          ),
          onTap: () {
            _showDetailDialog(content);
          },
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

  Widget _buildBookmarkButton() {
    return _buildIcon(Icons.bookmark_border_outlined);
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

  void _showDetailDialog(Content content) {
    final body = content.body.replaceAll("/media/", "$baseUrl/media/");
    final audio = "$baseUrl${content.audio}";
    final alertDialog = AlertDialog(
      content: Stack(
        children: [
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
          Column(
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
          )
        ],
      ),
    );
    Get.dialog(alertDialog).then((value) => print("Hello"));
  }
}

class ContentCardGridView extends HookWidget {
  final List<Content> contents;

  ContentCardGridView({Key key, this.contents});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300.0,
        // crossAxisSpacing: 10,
        // mainAxisSpacing: 10,
      ),
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
