import 'package:aukantun/config/app_assets.dart';
import 'package:aukantun/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:vitality/vitality.dart';

class CoreBackground extends StatelessWidget {
  final Widget child;
  final bool animated;
  const CoreBackground({
    super.key,
    required this.child,
    this.animated = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            animated ? _animated() : _normal(),
            child,
          ],
        ),
      ),
    );
  }

  Widget _normal() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.backgroundColor,
        image: DecorationImage(
          image: AssetImage(AppAssets.background),
          repeat: ImageRepeat.repeat,
        ),
      ),
    );
  }

  Widget _animated() {
    return Container(
      decoration:
          const BoxDecoration(gradient: AppColor.backgroundGradientColor),
      child: Vitality.randomly(
        maxOpacity: 0.8,
        minOpacity: 0.3,
        itemsCount: 40,
        whenOutOfScreenMode: WhenOutOfScreenMode.Reflect,
        maxSpeed: 1.5,
        maxSize: 50,
        minSize: 30,
        minSpeed: 0.5,
        randomItemsColors: const [AppColor.deepSkyBlue],
        randomItemsBehaviours: [
          ItemBehaviour(shape: ShapeType.Icon, icon: Symbols.playing_cards),
          ItemBehaviour(shape: ShapeType.Icon, icon: Symbols.sports_bar),
          ItemBehaviour(shape: ShapeType.Icon, icon: Symbols.casino),
        ],
      ),
    );
  }
}
