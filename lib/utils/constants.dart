import 'dart:io';

import 'package:flutter/material.dart';

class Constants {}

extension ContextExtensions on BuildContext {
  ColorScheme get myTheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;

  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;

  Size get sizeAppbar {
    final height = AppBar().preferredSize.height;

    return Size(
      screenWidth,
      height +
          (Platform.isWindows
              ? 75
              : Platform.isIOS
                  ? 50
                  : 70),
    );
  }
}

const double kPadding = 10;
const double kBorderRadius = 10;
const String nameApp = 'Videos Green Screen';
