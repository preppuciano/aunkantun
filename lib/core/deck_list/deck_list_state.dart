part of 'deck_list_bloc.dart';

abstract class DeckListState extends Equatable {
  const DeckListState();

  @override
  List<Object?> get props => [];
}

class DeckListStateInitial extends DeckListState {}

class LoadingDecksList extends DeckListState {}

class LoadedDecksList extends DeckListState {
  final List<DeckModel> decks;
  const LoadedDecksList({required this.decks});
}
