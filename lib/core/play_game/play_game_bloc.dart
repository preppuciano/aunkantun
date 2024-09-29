import 'package:aukantun/core/play_game/models/deck_play_model.dart';
import 'package:aukantun/core/play_game/models/play_game_model.dart';
import 'package:aukantun/models/card_model.dart';
import 'package:aukantun/models/deck_model/deck_model.dart';
import 'package:aukantun/models/friend_model.dart';
import 'package:aukantun/models/game_model/game_model.dart';
import 'package:aukantun/services/database_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'play_game_event.dart';
part 'play_game_state.dart';

class PlayGameBloc extends Bloc<PlayGameEvent, PlayGameState> {
  late DatabaseService databaseService;

  GameModel? game;
  late List<DeckModel> decksBase;
  late List<List<DeckModel>> decksCommunity;
  late List<FriendModel> friends;
  late List<List<CardModel>> cards;

  PlayGameBloc() : super(PlayGameInitial()) {
    databaseService = DatabaseService();
    reset();
    on<PlayGameStart>(_onPlayGameStart);
  }

  void reset({bool all = false}) {
    if (all) {
      game = null;
    }
    decksBase = [];
    decksCommunity = [];
    cards = [];
    friends = [];
  }

  Future<void> _onPlayGameStart(
      PlayGameStart event, Emitter<PlayGameState> emit) async {
    emit(PlayGameLoading(progress: 0));
    game = event.game;
    decksBase = event.decksBase;
    decksCommunity = event.decksCommunity;
    cards = List.filled(decksBase.length, [], growable: false);
    friends = event.friends;

    emit(PlayGameLoading(progress: 0.10));
    await Future.delayed(Duration(milliseconds: 500));
    emit(PlayGameLoading(progress: 0.15));
    await Future.delayed(Duration(milliseconds: 500));
    emit(PlayGameLoading(progress: 0.20));
    await Future.delayed(Duration(milliseconds: 500));
    emit(PlayGameLoading(progress: 0.25));
    await Future.delayed(Duration(milliseconds: 500));
    emit(PlayGameLoading(progress: 0.30));
    await Future.delayed(Duration(milliseconds: 500));

    List<DeckPlayModel> decksPlay = [];

    for (int i = 0; i < decksBase.length; i++) {
      emit(PlayGameLoading(progress: (0.6 * (i + 1) / decksBase.length) + 0.3));

      final deckBase = decksBase[i];
      final cardsDeckBase = await databaseService.getCardsDeckBase(
          gameId: game!.id, deck: deckBase);
      cards[i] = cardsDeckBase;

      for (int j = 0; j < decksCommunity[i].length; j++) {
        final deckCommunity = decksCommunity[i][j];
        List<CardModel> cardsDeckCommunity =
            await databaseService.getCardsDeckCommunity(
          gameId: game!.id,
          deckBaseId: deckBase.id,
          deckCommunity: deckCommunity,
        );
        cards[i].addAll(cardsDeckCommunity);
      }

      decksPlay.add(DeckPlayModel(deck: decksBase[i], cards: cards[i]));
    }

    emit(PlayGameLoading(progress: 0.90));

    PlayGameModel playGame = PlayGameModel(
      game: game!,
      decks: decksPlay,
      friends: friends,
    );
    reset();

    emit(PlayGameLoading(progress: 1));
    emit(PlayGameLoaded(playGame: playGame));
  }
}
