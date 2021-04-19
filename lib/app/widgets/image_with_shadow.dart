import 'dart:ui';

import 'package:flutter/material.dart';
import 'file:///D:/AndroidStudioProjects/tela_de_login/lib/app/app_theme.dart';

class ImageWithShadow extends StatelessWidget {
  final String imageAsset;

  const ImageWithShadow({Key key, this.imageAsset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: <Widget>[
          Opacity(
              opacity: 0.2,
              child: Image.asset(
                imageAsset,
                color: ThemeApp.appImageShadow,
                height: 160,
              )),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Image.asset(
              imageAsset,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}
