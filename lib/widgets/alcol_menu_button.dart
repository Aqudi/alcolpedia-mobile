import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlcolMenuButton extends StatelessWidget {
  final String label;
  final String routeName;
  final Border border;

  const AlcolMenuButton({
    Key key,
    this.label,
    @required this.routeName,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BorderRadius bordeRadius = BorderRadius.circular(50);

    return ListTile(
      contentPadding: const EdgeInsets.all(20),
      title: InkWell(
        borderRadius: bordeRadius,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: border ?? Border.all(color: Colors.white),
            borderRadius: bordeRadius,
          ),
          child: Text(
            '$label',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        onTap: () => Get.toNamed(routeName),
      ),
    );
  }
}
