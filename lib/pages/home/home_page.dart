import 'package:alcolpedia_mobile/utils/background_gradient.dart';
import 'package:alcolpedia_mobile/utils/palette.dart';
import 'package:alcolpedia_mobile/widgets/alcol_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AlcolAppBar(
          showTitle: false,
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: BackgroundGradient(
                  colors: [
                    Palette.darkGreen,
                    Palette.green,
                    Palette.ivory,
                    Palette.beige,
                  ],
                ),
              ),
            ),
            Center(
              child: Text("HomePage"),
            ),
          ],
        ),
      ),
    );
  }
}
