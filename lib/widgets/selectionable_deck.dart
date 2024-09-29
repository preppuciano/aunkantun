import 'package:aukantun/config/app_color.dart';
import 'package:aukantun/config/app_config.dart';
import 'package:aukantun/config/app_localizations.dart';
import 'package:aukantun/models/deck_model/deck_model.dart';
import 'package:aukantun/widgets/core/core_switch.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SelectionableDeck extends StatefulWidget {
  final DeckModel deck;
  final Function? onTap;
  final Function(bool)? onChanged;
  final int? countCards;
  final bool initialValue;
  final bool isLoading;

  const SelectionableDeck({
    super.key,
    required this.deck,
    this.onTap,
    this.onChanged,
    this.countCards,
    this.initialValue = false,
    this.isLoading = false,
  });

  @override
  State<SelectionableDeck> createState() => _SelectionableDeckState();
}

class _SelectionableDeckState extends State<SelectionableDeck> {
  late bool switchValue;

  @override
  void initState() {
    super.initState();
    switchValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: widget.isLoading,
      effect: ShimmerEffect(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        duration: Duration(seconds: 1),
      ),
      child: GestureDetector(
        onTap: () {
          if (widget.onTap != null) {
            if (!widget.deck.isRequired && !switchValue) {
              return;
            }
            widget.onTap?.call();
          } else {
            return;
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.softWhite,
            border: Border.all(color: AppColor.primaryColor, width: 4),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Skeleton.ignore(child: addSwitch())],
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          widget.deck.name,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                            height: 1,
                            overflow: TextOverflow.ellipsis,
                            fontSize: AppConfig.fontSizeLG,
                            color: AppColor.charcoalColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Flexible(
                        child: Text(
                          textAlign: TextAlign.center,
                          widget.deck.description,
                          maxLines: 3,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            height: 1,
                            fontSize: AppConfig.fontSizeMD,
                            color: AppColor.charcoalColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        numberCards(),
                        style: TextStyle(height: 1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String numberCards() {
    if (widget.countCards != null) {
      return '${widget.countCards} ${AppLocalizations.of(context)!.translate('widgets.selectionable_deck.cards')}';
    } else {
      return '${widget.deck.cardCount} ${AppLocalizations.of(context)!.translate('widgets.selectionable_deck.cards')}';
    }
  }

  Widget addSwitch() {
    if (widget.deck.isRequired) {
      return Container();
    }
    return CoreSwitch(
      value: switchValue,
      onChanged: (value) {
        setState(() => switchValue = value);
        widget.onChanged?.call(value);
      },
    );
  }
}
