part of 'database_bloc.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();

  @override
  List<Object?> get props => [];
}

class DatabaseInitial extends DatabaseState {}

class DatabaseFetchingGeneric extends DatabaseState {}

class DatabaseFetchedGame extends DatabaseState {
  final GameModel game;
  const DatabaseFetchedGame({required this.game});

  @override
  List<Object?> get props => [game.toMap()];
}

class DatabaseFetchedDecksBase extends DatabaseState {
  final List<DeckModel> decks;
  const DatabaseFetchedDecksBase({required this.decks});
}
