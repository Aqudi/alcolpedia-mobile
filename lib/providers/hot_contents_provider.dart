import 'package:hooks_riverpod/all.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/content.dart';
import '../services/content_service.dart';

final hotContentsProvider = StateProvider<List<Content>>((ref) => null);
final hotContentsViewModel =
    Provider.autoDispose((ref) => HotContentsViewModel(ref.read));

class HotContentsViewModel {
  final Reader read;

  HotContentsViewModel(this.read);

  void initState(int num) async {
    read(hotContentsProvider).state =
        await read(contentService).fetchHotContents(num);
  }

  void dispose() {
    read(hotContentsProvider).state.clear();
  }
}
