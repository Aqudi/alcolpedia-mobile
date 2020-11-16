import 'package:flutter/material.dart';

class AlcolHashChip extends StatelessWidget {
  final String tag;

  const AlcolHashChip({Key key, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(),
        ),
        child: Text("${this.tag}"),
      ),
      onTap: () => {},
    );
  }
}
