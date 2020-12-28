import 'package:flutter/material.dart';

import '../utils/palette.dart';

class AlcolHashChip extends StatelessWidget {
  final String tag;

  const AlcolHashChip({Key key, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bordeRadius = BorderRadius.circular(10);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      child: InkWell(
        borderRadius: bordeRadius,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: bordeRadius,
            border: Border.all(
              color: primaryGreen,
              width: 1.4,
            ),
          ),
          child: Text("$tag"),
        ),
        onTap: () => {},
      ),
    );
  }
}
