import 'package:alcolpedia_mobile/utils/palette.dart';
import 'package:alcolpedia_mobile/utils/app_routes.dart';
import 'package:alcolpedia_mobile/widgets/alcol_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlcolContentMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
      ),
      child: Container(
        width: Get.width / 3,
        decoration: BoxDecoration(
          color: Palette.deepDarkGreen,
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                  color: Palette.deepDarkGreen,
                  height: Get.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AlcolMenuButton(
                        label: 'Hot',
                        routeName: AppRoutes.hotPage,
                      ),
                      AlcolMenuButton(
                        label: '술게임',
                        routeName: AppRoutes.gamePage,
                      ),
                      AlcolMenuButton(
                        label: 'BGM',
                        routeName: AppRoutes.musicPage,
                      ),
                      AlcolMenuButton(
                        label: '건배사',
                        routeName: AppRoutes.battlecryPage,
                      ),
                      AlcolMenuButton(
                        label: '폭탄주',
                        routeName: AppRoutes.recipePage,
                      ),
                      AlcolMenuButton(
                        label: '옵션',
                        routeName: AppRoutes.optionPage,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget menu(String label) {
    return ListTile(
      contentPadding: const EdgeInsets.all(20),
      title: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          '$label',
          style: const TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
