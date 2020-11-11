import 'package:flutter/material.dart';

class AlcolAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  bool showTitle;
  final String title;

  AlcolAppBar({
    this.showTitle = true,
    this.title,
    Key key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: appbarTitle(),
      actions: <IconButton>[
        profileButton(),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    );
  }

  Widget appbarTitle() {
    if (showTitle) {
      return Text(title ?? "ALCOLPEDIA");
    }
    return Text("");
  }

  Widget profileButton() {
    return IconButton(
      icon: Icon(Icons.person),
      onPressed: () {},
    );
  }
}
