import 'package:aukantun/config/app_color.dart';
import 'package:flutter/material.dart';

class DeckCard extends StatelessWidget {
  final Color borderColor;
  final Widget child;
  const DeckCard({
    super.key,
    required this.child,
    this.borderColor = AppColor.charcoalColor,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1.4,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.softWhite,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor,
            width: 4,
          ),
        ),
        child: child,
      ),
    );
  }
}
