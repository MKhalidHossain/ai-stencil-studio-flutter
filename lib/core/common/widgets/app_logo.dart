import 'package:flutter/material.dart';

import '/core/constants/assets_const.dart';

class AppLogo extends StatelessWidget {
  final double height;
  final double width;

  const AppLogo({super.key, this.height = 120, this.width = 120});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsConst.images.appLogo,
      height: height,
      width: width,
      fit: BoxFit.contain,
    );
  }
}
