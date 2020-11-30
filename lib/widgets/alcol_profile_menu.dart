import 'package:alcolpedia_mobile/utils/palette.dart';
import 'package:alcolpedia_mobile/utils/app_routes.dart';
import 'package:alcolpedia_mobile/widgets/alcol_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
