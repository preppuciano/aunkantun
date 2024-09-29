import 'package:aukantun/models/game_model/game_model.dart';
import 'package:equatable/equatable.dart';
import 'package:aukantun/services/database_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_list_event.dart';
part 'game_list_state.dart';

class GameListBloc extends Bloc<GameListEvent, GameListState> {
  final DatabaseService databaseService;

  GameListBloc({required this.databaseService})
      : super(GameListStateInitial()) {
    on<FetchGameList>(_onFetchGameList);
  }

  Future<void> _onFetchGameList(
      FetchGameList event, Emitter<GameListState> emit) async {
    emit(LoadingGameList());
    List<GameModel> data = await databaseService.getGames();
    // await Future.delayed(Duration(seconds: 1));
    emit(LoadedGameList(games: data));
  }
}
