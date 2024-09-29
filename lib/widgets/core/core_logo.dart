import 'package:aukantun/config/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoreLogo extends StatelessWidget {
  const CoreLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppAssets.logo, fit: BoxFit.fill);
  }
}
