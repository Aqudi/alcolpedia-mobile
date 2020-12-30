import 'package:hooks_riverpod/all.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/content.dart';
import '../services/content_service.dart';
import '../utils/content_type.dart';

StateProvider<List<Content>> getContentsProvider() =>
    StateProvider<List<Content>>((ref) => null);

AutoDisposeProvider<ContentViewModel> getContentsViewModel(
        StateProvider<List<Content>> contentsProvider) =>
    Provider.autoDispose((ref) => ContentViewModel(ref.read, contentsProvider));

class ContentViewModel {
  final Reader read;
  final StateProvider<List<Content>> contentsProvider;

  ContentViewModel(this.read, this.contentsProvider);

  void initState(ContentType contentType) async {
    read(contentsProvider).state =
        await read(contentService).fetchContents(contentType);
  }

  void dispose() {
    read(contentsProvider).state.clear();
  }
}
