import 'package:flutter/material.dart';

class AppColor {
  static const Color brightCoral = Color(0xfffe5e5a);
  static const Color deepSkyBlue = Color(0xff3273a5);
  static const Color crimsonRed = Color(0xffb31216);
  static const Color appleGreen = Color(0xff60b235);
  static const Color darkNavyBlue = Color(0xff00285c);

  static const Color charcoalColor = Color(0xff303345);
  static const Color esmeraldColor = Color(0xff154e33);
  static const Color softWhite = Color(0xffefefef);
  static const Color graySpace = Color(0xff9E9E9E);

  static const Color primaryColor = appleGreen;
  static const Color onPrimaryColor = softWhite;
  static const Color primaryBorderColor = Color(0xff5b8035);
  static const LinearGradient primaryGradientColor = LinearGradient(
    colors: [
      Color(0xff56ab2f),
      Color(0xffa8e063),
    ],
    stops: [0, 1],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const Color secondaryColor = deepSkyBlue;
  static const Color onSecondaryColor = softWhite;
  static const Color secondaryBorderColor = Color(0xff1f4b62);
  static const LinearGradient secondaryGradientColor = LinearGradient(
    colors: [
      Color(0xff43cea2),
      Color(0xff316ca7),
    ],
    stops: [0, 1],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const Color dangerColor = crimsonRed;
  static const Color onDangerColor = softWhite;
  static const Color dangerBorderColor = Color(0xff5a090b);
  static const LinearGradient dangerGradientColor = LinearGradient(
    colors: [
      Color(0xffED4F4A),
      Color(0xffBB0207),
    ],
    stops: [0, 1],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const Color infoColor = brightCoral;
  static const Color onInfoColor = softWhite;
  static const Color infoBorderColor = Color(0xff7f322d);
  static const LinearGradient infoGradientColor = LinearGradient(
    colors: [
      Color(0xffFFF8B5),
      Color(0xffFFC700),
    ],
    stops: [0, 1],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const Color backgroundColor = darkNavyBlue;
  static const Color onBackgroundColor = softWhite;
  static const Color onBorderBackgroundColor = Color(0xff003668);
  static const LinearGradient backgroundGradientColor = LinearGradient(
    colors: [
      Color(0xff004889),
      Color(0xff090D32),
    ],
    stops: [0, 1],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
