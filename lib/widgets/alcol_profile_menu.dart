import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_routes.dart';
import '../utils/palette.dart';
import 'alcol_menu_button.dart';

class AlcolProfileMenu extends StatelessWidget {
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
                      Spacer(),
                      AlcolMenuButton(
                        label: '프로필',
                        routeName: AppRoutes.profilePage,
                      ),
                      AlcolMenuButton(
                        label: '건의하기',
                        routeName: AppRoutes.claimPage,
                      ),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      AlcolMenuButton(
                        label: '로그인',
                        border: Border.all(color: Colors.transparent),
                        routeName: AppRoutes.loginPage,
                      ),
                      AlcolMenuButton(
                        label: '회원가입',
                        border: Border.all(color: Colors.transparent),
                        routeName: AppRoutes.signupPage,
                      ),
                      Spacer(),
                      Spacer(),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
