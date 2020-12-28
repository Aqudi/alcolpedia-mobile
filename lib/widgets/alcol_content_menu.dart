import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_routes.dart';
import '../utils/palette.dart';
import 'alcol_menu_button.dart';

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
          color: deepDarkGreen,
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                  color: deepDarkGreen,
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
}
