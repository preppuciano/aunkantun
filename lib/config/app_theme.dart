import 'package:aukantun/config/app_color.dart';
import 'package:aukantun/config/app_config.dart';
import 'package:flutter/material.dart';

// https://material.io/resources/color/
// https://docs.flutter.dev/cookbook/design/fonts
// https://material.io/design/color/the-color-system.html#tools-for-picking-colors

// ignore: non_constant_identifier_names
ThemeData AppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColor.primaryColor,
      onPrimary: AppColor.onPrimaryColor,
      secondary: AppColor.secondaryColor,
      onSecondary: AppColor.onSecondaryColor,
      error: AppColor.primaryColor,
      onError: AppColor.primaryColor,
      surface: AppColor.backgroundColor,
      onSurface: AppColor.onBackgroundColor,
    ),
    fontFamily: AppConfig.fontFamily,
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: AppConfig.fontSizeXL),
      headlineMedium: TextStyle(fontSize: AppConfig.fontSizeXL),
      headlineSmall: TextStyle(fontSize: AppConfig.fontSizeXL),
      titleLarge: TextStyle(fontSize: AppConfig.fontSizeLG),
      titleMedium: TextStyle(fontSize: AppConfig.fontSizeLG),
      titleSmall: TextStyle(fontSize: AppConfig.fontSizeLG),
      bodyLarge: TextStyle(
        fontSize: AppConfig.fontSizeMD,
        color: AppColor.softWhite,
      ),
      bodyMedium: TextStyle(
        fontSize: AppConfig.fontSizeMD,
        color: AppColor.softWhite,
      ),
      bodySmall: TextStyle(
        fontSize: AppConfig.fontSizeMD,
        color: AppColor.softWhite,
      ),
    ),
  );
}

//  static const TextTheme whiteMountainView = TextTheme(
//     display4   : TextStyle(debugLabel: 'whiteMountainView display4',   fontFamily: 'Roboto', inherit: true, color: Colors.white70, decoration: TextDecoration.none),
//     display3   : TextStyle(debugLabel: 'whiteMountainView display3',   fontFamily: 'Roboto', inherit: true, color: Colors.white70, decoration: TextDecoration.none),
//     display2   : TextStyle(debugLabel: 'whiteMountainView display2',   fontFamily: 'Roboto', inherit: true, color: Colors.white70, decoration: TextDecoration.none),
//     display1   : TextStyle(debugLabel: 'whiteMountainView display1',   fontFamily: 'Roboto', inherit: true, color: Colors.white70, decoration: TextDecoration.none),
//     headline   : TextStyle(debugLabel: 'whiteMountainView headline',   fontFamily: 'Roboto', inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     title      : TextStyle(debugLabel: 'whiteMountainView title',      fontFamily: 'Roboto', inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     subhead    : TextStyle(debugLabel: 'whiteMountainView subhead',    fontFamily: 'Roboto', inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     body2      : TextStyle(debugLabel: 'whiteMountainView body2',      fontFamily: 'Roboto', inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     body1      : TextStyle(debugLabel: 'whiteMountainView body1',      fontFamily: 'Roboto', inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     caption    : TextStyle(debugLabel: 'whiteMountainView caption',    fontFamily: 'Roboto', inherit: true, color: Colors.white70, decoration: TextDecoration.none),
//     button     : TextStyle(debugLabel: 'whiteMountainView button',     fontFamily: 'Roboto', inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     subtitle   : TextStyle(debugLabel: 'whiteMountainView subtitle',   fontFamily: 'Roboto', inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     overline   : TextStyle(debugLabel: 'whiteMountainView overline',   fontFamily: 'Roboto', inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//   );