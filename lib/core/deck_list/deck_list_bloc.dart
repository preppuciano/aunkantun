import 'package:aukantun/models/deck_model/deck_model.dart';
import 'package:equatable/equatable.dart';
import 'package:aukantun/services/database_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'deck_list_event.dart';
part 'deck_list_state.dart';

class DeckListBloc extends Bloc<DeckListEvent, DeckListState> {
  final DatabaseService databaseService;

  DeckListBloc({required this.databaseService})
      : super(DeckListStateInitial()) {
    on<FetchBaseDeckList>(_onFetchBaseDeckList);
    on<FetchCommunityDeckList>(_onFetchCommunityDeckList);
  }

  Future<void> _onFetchBaseDeckList(
      FetchBaseDeckList event, Emitter<DeckListState> emit) async {
    emit(LoadingDecksList());
    final decks = await databaseService.getDecksBaseByGameId(event.gameId);
    // await Future.delayed(Duration(seconds: 1));
    emit(LoadedDecksList(decks: decks));
  }

  Future<void> _onFetchCommunityDeckList(
      FetchCommunityDeckList event, Emitter<DeckListState> emit) async {
    emit(LoadingDecksList());
    List<DeckModel> decks = await databaseService.getDecksByDeckBaseId(
        gameId: event.gameId, deckBaseId: event.deckBaseId);
    // await Future.delayed(Duration(seconds: 1));
    emit(LoadedDecksList(decks: decks));
  }
}
