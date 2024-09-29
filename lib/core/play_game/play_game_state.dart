part of 'play_game_bloc.dart';

abstract class PlayGameState extends Equatable {
  const PlayGameState();

  @override
  List<Object?> get props => [];
}

class PlayGameInitial extends PlayGameState {}

class PlayGameLoading extends PlayGameState {
  final double progress;
  const PlayGameLoading({
    this.progress = 0,
  });

  @override
  List<Object?> get props => [progress];
}

class PlayGameLoaded extends PlayGameState {
  final PlayGameModel playGame;
  const PlayGameLoaded({required this.playGame});
}
