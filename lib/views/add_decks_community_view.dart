import 'package:aukantun/config/app_localizations.dart';
import 'package:aukantun/core/deck_list/deck_list_bloc.dart';
import 'package:aukantun/models/deck_model/deck_model.dart';
import 'package:aukantun/models/game_model/game_model.dart';
import 'package:aukantun/widgets/core/core_grid_view.dart';
import 'package:aukantun/widgets/core_background.dart';
import 'package:aukantun/widgets/selectionable_deck.dart';
import 'package:aukantun/widgets/core/core_app_bar.dart';
import 'package:aukantun/widgets/core/core_button.dart';
import 'package:aukantun/widgets/core/core_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDecksCommunityView extends StatefulWidget {
  final GameModel game;
  final DeckModel deck;
  final List<DeckModel>? initialDeck;
  const AddDecksCommunityView({
    super.key,
    required this.deck,
    required this.game,
    this.initialDeck,
  });
  @override
  State<AddDecksCommunityView> createState() => _AddDecksCommunityViewState();
}

class _AddDecksCommunityViewState extends State<AddDecksCommunityView> {
  late DeckListBloc deckListBloc;
  List<DeckModel> decks = [];

  @override
  void initState() {
    super.initState();
    deckListBloc = BlocProvider.of<DeckListBloc>(context);
    deckListBloc.add(FetchCommunityDeckList(
        gameId: widget.game.id, deckBaseId: widget.deck.id));

    decks = widget.initialDeck ?? decks;
  }

  @override
  Widget build(BuildContext context) {
    print('🐛: ${widget.initialDeck?.length}');
    return CoreBackground(
      animated: false,
      child: SingleChildScrollView(
        primary: true,
        child: Column(
          children: [
            CoreAppBar(
              title: AppLocalizations.of(context)!
                  .translate('views.add_decks_community_view.title'),
              description: AppLocalizations.of(context)!
                  .translate('views.add_decks_community_view.description'),
              customTapBack: () => Navigator.pop(context, decks),
            ),
            CorePadding(
              child: Column(
                children: [
                  BlocBuilder(
                    bloc: deckListBloc,
                    builder: (context, state) {
                      if (state is LoadedDecksList) {
                        return CoreGridView(
                          children: state.decks.map((deck) {
                            return SelectionableDeck(
                              key: ValueKey(deck.id),
                              deck: deck,
                              initialValue: isAdded(deck),
                              onChanged: (value) {
                                if (value) {
                                  handleAddDeck(deck);
                                } else {
                                  handleRemoveDeck(deck);
                                }
                              },
                            );
                          }).toList(),
                        );
                      } else {
                        return CoreGridView(
                          children: List.filled(2, DeckModel.fake).map((deck) {
                            return SelectionableDeck(
                              isLoading: true,
                              deck: deck,
                            );
                          }).toList(),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  CoreButton(
                    buttonType: CoreButtonType.secondary,
                    text: 'Volver',
                    onPressed: () {
                      Navigator.pop(context, decks);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isAdded(DeckModel deckpene) {
    int index = decks.indexWhere((deck) => deck.id == deckpene.id);
    print('${deckpene.id} | ${index != -1}');
    return index != -1;
  }

  void handleAddDeck(DeckModel deckSelected) {
    if (!decks.any((deck) => deck.id == deckSelected.id)) {
      decks.add(deckSelected);
    }
  }

  void handleRemoveDeck(DeckModel deckSelected) {
    int index = decks.indexWhere((deck) => deck.id == deckSelected.id);
    if (index != -1) {
      decks.removeAt(index);
    }
  }
}
