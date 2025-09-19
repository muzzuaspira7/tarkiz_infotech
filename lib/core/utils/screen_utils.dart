import 'package:flutter/material.dart';

class ScreenUtils {
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _baseWidth;
  static late double _baseHeight;

  static void init(BuildContext context,
      {double baseWidth = 375, double baseHeight = 812}) {
    final size = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;
    _baseWidth = baseWidth;
    _baseHeight = baseHeight;
  }

  static double w(double value) => value * _screenWidth / _baseWidth;

  static double h(double value) => value * _screenHeight / _baseHeight;

  static double r(double value) => value * _screenWidth / _baseWidth;

  static double sp(double fontSize) => fontSize * _screenWidth / _baseWidth;

  static double sw(double fraction) => _screenWidth * fraction;

  static double sh(double fraction) => _screenHeight * fraction;
}

extension ScreenExtension on num {
  double get w => ScreenUtils.w(toDouble());
  double get h => ScreenUtils.h(toDouble());
  double get r => ScreenUtils.r(toDouble());
  double get sp => ScreenUtils.sp(toDouble());
  double get sw => ScreenUtils.sw(toDouble());
  double get sh => ScreenUtils.sh(toDouble());
}
