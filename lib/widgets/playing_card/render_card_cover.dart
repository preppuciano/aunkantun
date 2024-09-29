import 'package:aukantun/config/app_color.dart';
import 'package:aukantun/config/app_config.dart';
import 'package:aukantun/models/card_model.dart';
import 'package:aukantun/models/deck_model/deck_model.dart';
import 'package:aukantun/widgets/core/core_padding.dart';
import 'package:aukantun/widgets/playing_card/deck_card.dart';
import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class RenderCardCover extends StatelessWidget {
  final DeckModel deck;
  final CardModel card;
  final bool isSelected;
  final Widget? child;
  final double opacity;
  const RenderCardCover({
    super.key,
    required this.deck,
    required this.card,
    this.isSelected = false,
    this.child,
    this.opacity = 1.0,
  });

  factory RenderCardCover.carousel({
    required CardModel card,
    required DeckModel deck,
    bool isSelected = false,
  }) {
    return RenderCardCover(
      opacity: 0.8,
      isSelected: isSelected,
      deck: deck,
      card: card,
      child: Center(
        child: CorePadding(
          child: StrokeText(
            text: deck.name,
            strokeColor: AppColor.charcoalColor,
            strokeWidth: 5,
            textStyle: TextStyle(
              height: 1,
              fontSize: AppConfig.fontSizeLG,
              color: AppColor.softWhite,
            ),
          ),
        ),
      ),
    );
  }

  factory RenderCardCover.playing({
    required CardModel card,
    required DeckModel deck,
  }) {
    return RenderCardCover(deck: deck, card: card);
  }

  @override
  Widget build(BuildContext context) {
    return DeckCard(
      borderColor: isSelected ? AppColor.appleGreen : AppColor.charcoalColor,
      child: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              opacity: opacity,
              image: card.cover.file.imageProvider,
              repeat: ImageRepeat.repeat,
              alignment: Alignment.center,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
