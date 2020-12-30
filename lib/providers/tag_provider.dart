import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/tag.dart';
import '../services/tag_service.dart';

final tagProvider = StateProvider<List<Tag>>((ref) => null);

final tagViewModel = Provider.autoDispose((ref) => TagViewModel(ref.read));

class TagViewModel {
  final Reader read;
  TagViewModel(this.read);

  void initState() async {
    read(tagProvider).state = await read(tagService).fetchContentTags();
  }

  void dispose() {
    read(tagProvider).state.clear();
  }
}
