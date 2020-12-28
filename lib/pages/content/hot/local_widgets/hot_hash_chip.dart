import 'package:flutter/material.dart';

import '../../../../utils/palette.dart';

class HotHashChip extends StatelessWidget {
  final String tag;

  const HotHashChip({Key key, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bordeRadius = BorderRadius.circular(25);

    return Container(
      child: InkWell(
        borderRadius: bordeRadius,
        child: Container(
          constraints: BoxConstraints(
            minHeight: 25,
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
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
          child: Center(
            child: Text(
              tag,
              style: TextStyle(
                fontSize: 9,
              ),
            ),
          ),
        ),
        onTap: () => {},
      ),
    );
  }
}
