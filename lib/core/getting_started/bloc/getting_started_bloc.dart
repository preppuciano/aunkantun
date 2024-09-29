import 'package:aukantun/core/getting_started/flow/getting_started_flow.dart';
import 'package:aukantun/core/getting_started/flow/handlers/base_handler.dart';
import 'package:aukantun/models/deck_model/deck_model.dart';
import 'package:aukantun/models/friend_model.dart';
import 'package:aukantun/models/game_model/game_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'getting_started_event.dart';
part 'getting_started_state.dart';

class GettingStartedBloc
    extends Bloc<GettingStartedEvent, GettingStartedState> {
  late GettingStartedFlow flow;
  late BaseHandler? currentHandle;
  late GameModel? game;
  late List<DeckModel> decksBase;
  late List<List<DeckModel>> decksCommunity;
  late List<FriendModel> friends;

  GettingStartedBloc({this.game}) : super(GettingSartedInitial()) {
    flow = GettingStartedFlow(bloc: this);
    currentHandle = flow.step1;
    game = null;
    decksBase = [];
    decksCommunity = [];
    friends = [];

    on<GettingStartedInit>(_onGettingStartedInit);
    on<GettingStartedSelectDecksViewComplete>(
        _onGettingStartedSelectDecksViewComplete);
    on<GettingStartedAddFriendsViewComplete>(
        _onGettingStartedAddFriendsViewComplete);
  }

  void _onGettingStartedInit(
      GettingStartedInit event, Emitter<GettingStartedState> emit) {
    emit(GettingStartedInitLoading());
    flow = GettingStartedFlow(bloc: this);
    currentHandle = flow.step1;
    game = event.game;
    decksBase = [];
    decksCommunity = [];
    friends = [];
    emit(GettingStartedInitLoaded());
  }

  void _onGettingStartedSelectDecksViewComplete(
      GettingStartedSelectDecksViewComplete event,
      Emitter<GettingStartedState> emit) {
    emit(GettingStartedSelectDecksLoading());
    decksBase = event.decksBase;
    decksCommunity = event.decksCommunity;
    currentHandle = currentHandle?.next;
    emit(GettingStartedSelectDecksLoaded());
  }

  void _onGettingStartedAddFriendsViewComplete(
      GettingStartedAddFriendsViewComplete event,
      Emitter<GettingStartedState> emit) {
    emit(GettingStartedAddFriendsLoading());
    friends = event.friends;
    currentHandle = currentHandle?.next;
    emit(GettingStartedAddFriendsLoaded());
  }
}
