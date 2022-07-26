import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Config {
  MediaQueryData? _mediaQueryData;
  static double? screenHeight;
  static double? screenWidth;
  static Orientation? orientation;
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData!.size.height;
    screenWidth = _mediaQueryData!.size.width;
    orientation = _mediaQueryData!.orientation;
  }
}

double getScreenHeight = Get.context!.height;
double getScreenWidth = Get.context!.width;

double getHeight(double convertHeight) {
  const figmaDesignHeight = 812;
  double newScreenHeight = figmaDesignHeight / convertHeight;
  return getScreenHeight / newScreenHeight;
}

double getWidth(double convertWidth) {
  const figmaDesignWidth = 375;
  double newScreenWidth = figmaDesignWidth / convertWidth;
  return getScreenWidth / newScreenWidth;
}
