import 'package:aukantun/config/app_color.dart';
import 'package:aukantun/config/app_config.dart';
import 'package:aukantun/models/card_model.dart';
import 'package:aukantun/widgets/core/core_padding.dart';
import 'package:aukantun/widgets/playing_card/deck_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class RenderCardContent extends StatelessWidget {
  final CardModel card;
  const RenderCardContent({
    super.key,
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
    if (card.content != null) {
      return DeckCard(
        child: Center(
          child: CorePadding(
            child: Text(
              card.content!,
              style: TextStyle(
                height: 1,
                fontSize: AppConfig.fontSizeLG,
                color: AppColor.charcoalColor,
              ),
            ),
          ),
        ),
      );
    }
    if (card.contentHTML != null) {
      return DeckCard(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: HtmlWidget(
            textStyle: TextStyle(color: AppColor.charcoalColor, fontSize: 16),
            customStylesBuilder: (element) {
              return null;
            },
            card.contentHTML!,
          ),
        ),
      );
    }
    return Text('');
  }
}
