part of 'deck_list_bloc.dart';

abstract class DeckListEvent extends Equatable {
  const DeckListEvent();

  @override
  List<Object?> get props => [];
}

class FetchBaseDeckList extends DeckListEvent {
  final String gameId;
  const FetchBaseDeckList({required this.gameId});
}

class FetchCommunityDeckList extends DeckListEvent {
  final String gameId;
  final String deckBaseId;
  const FetchCommunityDeckList(
      {required this.gameId, required this.deckBaseId});
}
