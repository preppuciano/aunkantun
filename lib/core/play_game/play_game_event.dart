part of 'play_game_bloc.dart';

abstract class PlayGameEvent extends Equatable {
  const PlayGameEvent();

  @override
  List<Object?> get props => [];
}

class PlayGameStart extends PlayGameEvent {
  final GameModel game;
  final List<DeckModel> decksBase;
  final List<List<DeckModel>> decksCommunity;
  final List<FriendModel> friends;
  const PlayGameStart({
    required this.game,
    required this.decksBase,
    required this.decksCommunity,
    required this.friends,
  });
}
