import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlcolMenuButton extends StatelessWidget {
  final String label;
  final String routeName;
  final Border border;
  final bool disabled;

  const AlcolMenuButton({
    Key key,
    this.label,
    @required this.routeName,
    this.border,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bordeRadius = BorderRadius.circular(50);

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
          onTap: () {
            if (disabled) {
              Get.showSnackbar(GetBar(
                title: "Notice",
                message: "현재 앱에서는 지원하지 않는 기능입니다.",
                duration: Duration(seconds: 2),
              ));
            } else {
              Get.back();
              Get.offNamedUntil(routeName, (route) => route.isFirst);
            }
          }),
    );
  }
}
