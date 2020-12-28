import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/content.dart';
import '../services/content_service.dart';
import '../utils/content_type.dart';

final contentsProvider = StateProvider<List<Content>>((ref) => null);

final contentsViewModel =
    Provider.autoDispose((ref) => ContentViewModel(ref.read));

class ContentViewModel {
  final Reader read;
  ContentViewModel(this.read);

  void initState(ContentType contentType) async {
    read(contentsProvider).state =
        await read(contentService).fetchContents(contentType);
  }

  void dispose() {
    read(contentsProvider).state.clear();
  }
}
