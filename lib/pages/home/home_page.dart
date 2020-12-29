import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

import '../../models/tag.dart';
import '../../providers/tag_provider.dart';
import '../../utils/background_gradient.dart';
import '../../utils/palette.dart';
import '../../widgets/alcol_hash_chip.dart';
import '../../widgets/alcol_scaffold.dart';
import 'local_widgets/home_searchbar.dart';
import 'local_widgets/home_title.dart';
import 'local_widgets/widgets.dart';

class TagList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read(tagViewModel).initState();
      return context.read(tagViewModel).dispose;
    }, []);

    final tags = useProvider(tagProvider).state;

    if (tags == null) {
      return Container(child: const Center(child: Text("태그를 불러올 수 없습니다.")));
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: Colors.transparent),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 10.0,
        runSpacing: 5.0,
        children: List.generate(
            tags.length, (index) => AlcolHashChip(tag: tags[index].title)),
      ),
    );
  }
}

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AlcolScaffold(
        appBarTitle: false,
        body: Stack(
          children: [
            Container(
              constraints: BoxConstraints(minHeight: Get.height * 0.97),
              decoration: BoxDecoration(
                gradient: BackgroundGradient(
                  colors: [
                    darkGreen,
                    green,
                    ivory,
                    beige,
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * 0.2,
                  ),
                  Container(
                    child: Column(
                      children: [
                        HomeTitle(),
                        SizedBox(
                          height: 30,
                        ),
                        HomeSearchBar(),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  TagList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
