import 'package:aukantun/core/play_game/models/deck_play_model.dart';
import 'package:aukantun/models/friend_model.dart';
import 'package:aukantun/models/game_model/game_model.dart';

class PlayGameModel {
  final GameModel game;
  final List<DeckPlayModel> decks;
  final List<FriendModel> friends;

  PlayGameModel({
    required this.game,
    required this.decks,
    required this.friends,
  }) {
    sortDecks();
  }

  void sortDecks() {
    decks.sort((a, b) => a.deck.index.compareTo(b.deck.index));
  }

  void sortFriends() {
    friends.sort((a, b) => b.score.compareTo(a.score));
  }

  FriendModel getCurrentTurn(int totalTurns) {
    return friends[totalTurns % friends.length];
  }
}
