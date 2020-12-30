import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/content.dart';
import '../utils/content_type.dart';
import 'constants.dart';

final contentService =
    Provider.autoDispose<ContentService>((ref) => ContentServiceImpl());

abstract class ContentService {
  final Dio dio = Dio();
  Future<List<Content>> fetchContents(ContentType contentType);
}

class ContentServiceImpl extends ContentService {
  Future<List<Content>> fetchContents(ContentType contentType) async {
    var response =
        await dio.get("$apiBaseUrl/articles?name=${contentType.string}");

    var contents = <Content>[];
    for (var content in response.data) {
      contents.add(Content.fromJson(content));
    }
    return contents;
  }
}
