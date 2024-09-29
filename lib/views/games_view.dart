import 'package:aukantun/config/app_localizations.dart';
import 'package:aukantun/core/game_list/game_list_bloc.dart';
import 'package:aukantun/models/game_model/game_model.dart';
import 'package:aukantun/widgets/card_game.dart';
import 'package:aukantun/widgets/core/core_app_bar.dart';
import 'package:aukantun/widgets/core/core_padding.dart';
import 'package:aukantun/widgets/core_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamesView extends StatefulWidget {
  const GamesView({super.key});
  @override
  State<GamesView> createState() => _GamesViewState();
}

class _GamesViewState extends State<GamesView> {
  late GameListBloc gameListBloc;

  @override
  void initState() {
    super.initState();
    gameListBloc = BlocProvider.of<GameListBloc>(context);
    gameListBloc.add(const FetchGameList());
  }

  @override
  Widget build(BuildContext context) {
    return CoreBackground(
      animated: true,
      child: SingleChildScrollView(
          child: Column(
        children: [
          CoreAppBar(
            title: AppLocalizations.of(context)!
                .translate('views.games_view.title'),
            description: AppLocalizations.of(context)!
                .translate('views.games_view.description'),
          ),
          CorePadding(
            child: BlocBuilder(
              bloc: gameListBloc,
              builder: (context, state) {
                if (state is LoadedGameList) {
                  return Column(
                      children: state.games
                          .map((game) => CardGame(game: game))
                          .toList());
                } else {
                  return Column(
                      children: List.filled(10, GameModel.fake)
                          .map((game) => CardGame(game: game, isLoading: true))
                          .toList());
                }
              },
            ),
          )
        ],
      )),
    );
  }
}
