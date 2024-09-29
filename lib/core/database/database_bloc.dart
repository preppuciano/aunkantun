import 'package:aukantun/models/deck_model/deck_model.dart';
import 'package:aukantun/models/game_model/game_model.dart';
import 'package:aukantun/services/database_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  final DatabaseService databaseService;
  DatabaseBloc({required this.databaseService}) : super(DatabaseInitial()) {
    on<DatabaseFetchGame>(_onDatabaseFetchGame);
    on<DatabaseFetchDecksBase>(_onDatabaseFetchDecksBase);
  }

  Future<void> _onDatabaseFetchGame(
      DatabaseFetchGame event, Emitter<DatabaseState> emit) async {
    emit(DatabaseFetchingGeneric());
    final game = await databaseService.getGameById(event.gameId);
    // await Future.delayed(Duration(seconds: 2));
    emit(DatabaseFetchedGame(game: game));
  }

  Future<void> _onDatabaseFetchDecksBase(
      DatabaseFetchDecksBase event, Emitter<DatabaseState> emit) async {
    emit(DatabaseFetchingGeneric());
    final decks = await databaseService.getDecksBaseByGameId(event.gameId);
    // await Future.delayed(Duration(seconds: 2));
    emit(DatabaseFetchedDecksBase(decks: decks));
  }
}
