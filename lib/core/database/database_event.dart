part of 'database_bloc.dart';

abstract class DatabaseEvent extends Equatable {
  const DatabaseEvent();

  @override
  List<Object?> get props => [];
}

class DatabaseFetchGame extends DatabaseEvent {
  final String gameId;
  const DatabaseFetchGame({required this.gameId});
}

class DatabaseFetchDecksBase extends DatabaseEvent {
  final String gameId;
  const DatabaseFetchDecksBase({required this.gameId});
}
