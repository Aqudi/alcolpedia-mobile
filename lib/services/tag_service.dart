import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/tag.dart';
import 'constants.dart';

final tagService = Provider.autoDispose<TagService>((ref) => TagServiceImpl());

abstract class TagService {
  final Dio dio = Dio();
  Future<List<Tag>> fetchContentTags();
}

class TagServiceImpl extends TagService {
  Future<List<Tag>> fetchContentTags() async {
    var response = await dio.get("$apiBaseUrl/tag");

    if (response.statusCode != 200) {
      throw Exception(response.data);
    }
    var tags = <Tag>[];
    for (var tag in response.data) {
      tags.add(Tag.fromJson(tag));
    }
    return tags;
  }
}
