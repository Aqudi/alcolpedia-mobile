import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/alcol_scaffold.dart';
import '../local_widgets/content_searchbar.dart';
import '../local_widgets/content_title.dart';

class ContentScaffold extends StatelessWidget {
  final Color appBarBackgroundColor;
  final ContentTitle contentTitle;
  final Widget body;

  const ContentScaffold({
    Key key,
    this.appBarBackgroundColor,
    this.body,
    @required this.contentTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AlcolScaffold(
        appBartitleWidget: ContentSearchBar(),
        appBarBackgroundColor: appBarBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * 0.13,
              ),
              contentTitle,
              SizedBox(
                height: Get.height * 0.1,
              ),
              _buildBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return body ?? Text("아직 등록된 컨텐츠가 없습니다 ㅜㅜ");
  }
}
