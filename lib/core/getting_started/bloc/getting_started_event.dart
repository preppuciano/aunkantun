part of 'getting_started_bloc.dart';

class GettingStartedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GettingStartedInit extends GettingStartedEvent {
  final GameModel game;
  GettingStartedInit({required this.game});
}

class GettingStartedSelectDecksViewComplete extends GettingStartedEvent {
  final List<DeckModel> decksBase;
  final List<List<DeckModel>> decksCommunity;
  GettingStartedSelectDecksViewComplete(
      {required this.decksBase, required this.decksCommunity});
}

class GettingStartedAddFriendsViewComplete extends GettingStartedEvent {
  final List<FriendModel> friends;
  GettingStartedAddFriendsViewComplete({required this.friends});
}
