import 'package:flutter/cupertino.dart';

class AppSize {
  late double sheight;
  late double swidth;
  late bool isLandScape;

  AppSize(BuildContext context) {
    sheight = MediaQuery.of(context).size.height;
    swidth = MediaQuery.of(context).size.width;
    if (swidth > 600)
      isLandScape = true;
    else
      isLandScape = false;
  }
}
