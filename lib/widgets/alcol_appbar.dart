import 'package:flutter/material.dart';

class AlcolAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final bool showTitle;
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
        profileButton(context),
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

  Widget profileButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.person),
      onPressed: () {
        Scaffold.of(context).openEndDrawer();
      },
    );
  }
}
