import 'package:alcolpedia_mobile/utils/palette.dart';
import 'package:flutter/material.dart';

class HotHashChip extends StatelessWidget {
  final String tag;

  const HotHashChip({Key key, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BorderRadius bordeRadius = BorderRadius.circular(10);

    return Container(
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
              color: Palette.primaryGreen,
              width: 1.4,
            ),
          ),
          child: Text("${this.tag}"),
        ),
        onTap: () => {},
      ),
    );
  }
}
