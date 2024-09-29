import 'package:aukantun/config/app_localizations.dart';
import 'package:aukantun/core/deck_list/deck_list_bloc.dart';
import 'package:aukantun/core/getting_started/bloc/getting_started_bloc.dart';
import 'package:aukantun/models/deck_model/deck_model.dart';
import 'package:aukantun/models/game_model/game_model.dart';
import 'package:aukantun/services/database_service.dart';
import 'package:aukantun/utils/sound_manager.dart';
import 'package:aukantun/views/add_decks_community_view.dart';
import 'package:aukantun/widgets/core/core_grid_view.dart';
import 'package:aukantun/widgets/core_background.dart';
import 'package:aukantun/widgets/selectionable_deck.dart';
import 'package:aukantun/widgets/core/core_app_bar.dart';
import 'package:aukantun/widgets/core/core_button.dart';
import 'package:aukantun/widgets/core/core_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectDecksPageView extends StatefulWidget {
  final GameModel game;
  const SelectDecksPageView({
    super.key,
    required this.game,
  });
  @override
  State<SelectDecksPageView> createState() => _SelectDecksPageViewState();
}

class _SelectDecksPageViewState extends State<SelectDecksPageView> {
  late DeckListBloc deckListBloc;
  late GettingStartedBloc gettingStartedBloc;
  List<DeckModel> decksBase = [];
  List<List<DeckModel>> decksCommunity = [];

  @override
  void initState() {
    super.initState();
    gettingStartedBloc = BlocProvider.of<GettingStartedBloc>(context);
    deckListBloc = BlocProvider.of<DeckListBloc>(context);
    deckListBloc.add(FetchBaseDeckList(gameId: widget.game.id));
  }

  @override
  Widget build(BuildContext context) {
    return CoreBackground(
      animated: false,
      child: SingleChildScrollView(
        primary: true,
        child: Column(
          children: [
            CoreAppBar(
              title: AppLocalizations.of(context)!
                  .translate('views.select_decks_view.title'),
              description: AppLocalizations.of(context)!
                  .translate('views.select_decks_view.description'),
            ),
            CorePadding(
              child: Column(
                children: [
                  BlocConsumer(
                    bloc: deckListBloc,
                    builder: (context, state) {
                      if (state is LoadedDecksList) {
                        return CoreGridView(
                          children: state.decks.map((deck) {
                            return SelectionableDeck(
                              countCards: countCards(deck),
                              deck: deck,
                              onTap: () async {
                                await SoundManager().playSecondaryButton();
                                final exp = await viewDecksCommunity(deck);
                                handleAddDeckCommunity(deck, exp);
                                setState(() {});
                              },
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
                                isLoading: true, deck: deck);
                          }).toList(),
                        );
                      }
                    },
                    listener: (context, state) {
                      if (state is LoadedDecksList) {
                        for (var deck in state.decks) {
                          if (deck.isRequired) {
                            decksBase.add(deck);
                            decksCommunity.add([]);
                          }
                        }
                        setState(() {});
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  BlocListener(
                    bloc: gettingStartedBloc,
                    listener: (context, state) {
                      if (state is GettingStartedSelectDecksLoaded) {
                        gettingStartedBloc.currentHandle?.pushPage(context);
                      }
                    },
                    child: CoreButton(
                        heroTag: 'main',
                        text: 'Siguiente',
                        onPressed:
                            decksBase.isNotEmpty ? handleNextStep : null),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<DeckModel>?> viewDecksCommunity(DeckModel deckSelected) {
    int index = decksBase.indexWhere((deck) => deck.id == deckSelected.id);
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => DeckListBloc(databaseService: DatabaseService()),
          child: AddDecksCommunityView(
            deck: deckSelected,
            game: widget.game,
            initialDeck: index != -1 ? decksCommunity[index] : null,
          ),
        ),
      ),
    );
  }

  int? countCards(DeckModel deckSelected) {
    int index = decksBase.indexWhere((deck) => deck.id == deckSelected.id);
    int count = 0;
    if (index != -1) {
      count = decksBase[index].cardCount;
      for (var p in decksCommunity[index]) {
        count = count + p.cardCount;
      }
      return count;
    }
    return null;
  }

  void handleAddDeckCommunity(DeckModel deckSelected, List<DeckModel>? exp) {
    int index = decksBase.indexWhere((deck) => deck.id == deckSelected.id);
    if (index != -1 && exp != null) {
      decksCommunity[index] = exp;
    }
  }

  void handleAddDeck(DeckModel deckSelected) {
    if (!decksBase.any((deck) => deck.id == deckSelected.id)) {
      decksBase.add(deckSelected);
      decksCommunity.add([]);
    }
  }

  void handleRemoveDeck(DeckModel deckSelected) {
    int index = decksBase.indexWhere((deck) => deck.id == deckSelected.id);
    if (index != -1) {
      decksBase.removeAt(index);
      decksCommunity.removeAt(index);
    }
  }

  void handleNextStep() {
    gettingStartedBloc.add(GettingStartedSelectDecksViewComplete(
        decksBase: decksBase, decksCommunity: decksCommunity));
  }
}
