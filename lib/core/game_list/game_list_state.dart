part of 'game_list_bloc.dart';

abstract class GameListState extends Equatable {
  const GameListState();

  @override
  List<Object?> get props => [];
}

class GameListStateInitial extends GameListState {}

class LoadingGameList extends GameListState {}

class LoadedGameList extends GameListState {
  final List<GameModel> games;
  const LoadedGameList({required this.games});
}
