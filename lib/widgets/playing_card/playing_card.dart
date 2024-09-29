import 'package:aukantun/models/card_model.dart';
import 'package:aukantun/models/deck_model/deck_model.dart';
import 'package:aukantun/widgets/playing_card/render_card_content.dart';
import 'package:aukantun/widgets/playing_card/render_card_cover.dart';
import 'package:flutter/material.dart';

class PlayingCard extends StatefulWidget {
  final bool isSelected;
  final Function? onTap;
  final CardModel card;
  final DeckModel deck;
  const PlayingCard({
    super.key,
    this.isSelected = false,
    this.onTap,
    required this.card,
    required this.deck,
  });

  @override
  State<PlayingCard> createState() => _PlayingCardState();
}

class _PlayingCardState extends State<PlayingCard> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isVisible = !isVisible;
        });
      },
      child: isVisible ? cardVisible() : cardHidden(),
    );
  }

  Widget cardVisible() {
    return RenderCardContent(card: widget.card);
  }

  Widget cardHidden() {
    return RenderCardCover(card: widget.card, deck: widget.deck);
  }
}
